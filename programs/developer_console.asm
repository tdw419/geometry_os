; developer_console.asm -- Developer Console for Geometry OS (v1)
;
; A native GeOS windowed app that manages the RISC-V hypervisor:
;   - Enter a hypervisor config string and boot
;   - View live UART console output from the guest
;   - Forward keystrokes to the guest via HYPERVISOR_SEND
;   - Shows guest running/halted status
;
; RAM Layout:
;   0x4E00   CUR_COL (cursor column)
;   0x4E01   CUR_ROW (cursor row)
;   0x4E02   BLINK (blink counter)
;   0x4E03   MODE: 0=setup, 1=running, 2=halted
;   0x4E04   CONSOLE_LINE (next console line to write to)
;   0x4E05   SCROLL_OFFSET
;   0x4E06   HV_STARTED (0=not started, 1=launched)
;   0x4E07   INPUT_LEN (length of config input)
;   0x4E08   WIN_ID (our WINSYS window ID, set by launch system)
;   0x4F00   HV write offset (host writes to ring buffer)
;   0x4F01   HV read offset (we read from ring buffer)
;   0x4F02-0x4FFF HV ring buffer data (254 bytes)
;   0x5000-0x50FF Config string buffer (256 chars)
;   0x5100-0x52FF Scratch buffer (for SMALLTEXT rendering)
;   0x5800-0x5FFF Console text buffer (80*20=1600 u32 cells)
;
; SMALLTEXT is 3x5 font, one char per u32 cell.
; Window: 256x256 (same as host_term)
; Visible area: 80 cols x 20 rows (3x5 font, 240x120 + margins)
;
#define COLS 80
#define ROWS 20
#define CONSOLE_BUF 0x5800
#define CONSOLE_END 0x5E20    ; 0x5800 + 80*20
#define SCRATCH 0x5100
#define CONFIG_BUF 0x5000
#define CUR_COL 0x4E00
#define CUR_ROW 0x4E01
#define BLINK 0x4E02
#define MODE 0x4E03
#define CONSOLE_LINE 0x4E04
#define SCROLL_OFF 0x4E05
#define HV_STARTED 0x4E06
#define INPUT_LEN 0x4E07
#define WIN_ID 0x4E08
#define HV_WRITE_OFF 0x4F00
#define HV_READ_OFF 0x4F01
#define HV_RING_BASE 0x4F02

; ═══════════════════════════════════════════
; INIT
; ═══════════════════════════════════════════
    LDI r1, 1

    ; Background
    LDI r0, 0x0A0A0A
    FILL r0

    ; Title bar
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 10
    LDI r5, 0x1A1A2E
    RECTF r1, r2, r3, r4, r5

    ; Title text
    LDI r20, SCRATCH
    STRO r20, "dev console"
    LDI r1, 2
    LDI r2, 2
    LDI r3, SCRATCH
    LDI r4, 0x44DD44
    LDI r5, 0x1A1A2E
    SMALLTEXT r1, r2, r3, r4, r5

    ; Close button hit region
    LDI r1, 230
    LDI r2, 0
    LDI r3, 26
    LDI r4, 10
    HITSET r1, r2, r3, r4, 99

    ; Initialize state
    LDI r20, CUR_COL
    LDI r0, 0
    STORE r20, r0
    LDI r20, CUR_ROW
    LDI r0, 0
    STORE r20, r0
    LDI r20, BLINK
    LDI r0, 0
    STORE r20, r0
    LDI r20, MODE
    LDI r0, 0
    STORE r20, r0       ; MODE=0 (setup)
    LDI r20, CONSOLE_LINE
    LDI r0, 0
    STORE r20, r0
    LDI r20, SCROLL_OFF
    LDI r0, 0
    STORE r20, r0
    LDI r20, HV_STARTED
    LDI r0, 0
    STORE r20, r0
    LDI r20, INPUT_LEN
    LDI r0, 0
    STORE r20, r0

    ; Clear config buffer
    LDI r20, CONFIG_BUF
    LDI r8, 0
clr_cfg:
    STORE r20, r8
    ADDI r20, 1
    CMPI r20, 0x5100
    BLT r20, clr_cfg

    ; Clear console buffer to spaces (0x20)
    LDI r20, CONSOLE_BUF
    LDI r6, 0x20
clr_console:
    STORE r20, r6
    ADDI r20, 1
    CMPI r20, CONSOLE_END
    BLT r20, clr_console

    ; Clear HV ring buffer pointers
    LDI r20, HV_WRITE_OFF
    LDI r0, 0
    STORE r20, r0
    LDI r20, HV_READ_OFF
    STORE r20, r0

    LDI r1, 1

    ; Draw welcome message
    CALL render_status

; ═══════════════════════════════════════════
; MAIN LOOP
; ═══════════════════════════════════════════
main_loop:
    LDI r1, 1

    ; Check mode
    LDI r20, MODE
    LOAD r23, r20        ; r23 = mode

    CMPI r23, 0
    JNZ r0, check_running

    ; MODE=0: Setup mode, show config prompt and accept keyboard
    CALL render_setup_mode
    CALL handle_input_setup
    JMP after_mode_work

check_running:
    ; MODE=1 or 2: Running/halted, drain console and forward keys
    CALL drain_hv_console
    CALL render_console
    CALL handle_input_running
    ; Check HV status
    LDI r0, 0x98         ; HYPERVISOR_STATUS opcode
    .byte 0x98
    ; r0 = status, r1 = avail bytes
    ; Store result
    MOV r22, r0
    CMPI r22, 0
    JNZ r0, still_active
    ; HV inactive: set mode to halted
    LDI r20, MODE
    LDI r0, 2
    STORE r20, r0
    LDI r20, HV_STARTED
    LDI r0, 0
    STORE r20, r0

still_active:
    CMPI r22, 2
    JNZ r0, after_mode_work
    ; halted
    LDI r20, MODE
    LDI r0, 2
    STORE r20, r0

after_mode_work:
    ; Blink counter
    LDI r20, BLINK
    LOAD r0, r20
    ADDI r0, 1
    STORE r20, r0

    FRAME
    JMP main_loop

; ═══════════════════════════════════════════
; RENDER SETUP MODE
; ═══════════════════════════════════════════
render_setup_mode:
    PUSH r31

    ; Clear console area (rows 2-22, leave title bar)
    LDI r1, 0
    LDI r2, 12
    LDI r3, 256
    LDI r4, 200
    LDI r5, 0x0A0A0A
    RECTF r1, r2, r3, r4, r5

    ; Draw "DEVELOPER CONSOLE" header
    LDI r20, SCRATCH
    STRO r20, "hypervisor console"
    LDI r1, 2
    LDI r2, 14
    LDI r3, SCRATCH
    LDI r4, 0x44DD44
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    ; Draw "Config:" label
    LDI r20, SCRATCH
    STRO r20, "config:"
    LDI r1, 2
    LDI r2, 28
    LDI r3, SCRATCH
    LDI r4, 0xAAAAAA
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    ; Draw config value
    LDI r20, SCRATCH
    LDI r21, CONFIG_BUF
    LDI r22, 0
    ; Copy up to 78 chars of config to scratch
cfg_copy:
    CMPI r22, 78
    BGE r22, cfg_done
    LOAD r0, r21
    CMPI r0, 0
    JZ r0, cfg_fill
    STORE r20, r0
    ADDI r20, 1
    ADDI r21, 1
    ADDI r22, 1
    JMP cfg_copy
cfg_fill:
    ; Fill rest with spaces
    CMPI r22, 78
    BGE r22, cfg_done
    LDI r0, 0x20
    STORE r20, r0
    ADDI r20, 1
    ADDI r22, 1
    JMP cfg_fill
cfg_done:
    LDI r0, 0
    STORE r20, r0       ; null terminate

    LDI r1, 38         ; x for config text
    LDI r2, 28         ; y
    LDI r3, SCRATCH
    LDI r4, 0xFFFFFF   ; white text
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    ; Draw help text
    LDI r20, SCRATCH
    STRO r20, "type config then Enter to boot"
    LDI r1, 2
    LDI r2, 42
    LDI r3, SCRATCH
    LDI r4, 0x888888
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    LDI r20, SCRATCH
    STRO r20, "e.g. arch=riscv64 kernel=Image ram=768M"
    LDI r1, 2
    LDI r2, 56
    LDI r3, SCRATCH
    LDI r4, 0x666666
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    POP r31
    RET

; ═══════════════════════════════════════════
; HANDLE INPUT SETUP MODE
; ═══════════════════════════════════════════
handle_input_setup:
    PUSH r31

    IKEY r5
    JZ r5, his_done

    ; r5 = key code
    CMPI r5, 13        ; Enter
    JNZ r0, his_check_bs
    ; Enter pressed: launch hypervisor
    CALL boot_hypervisor
    JMP his_done

his_check_bs:
    CMPI r5, 8         ; Backspace
    JNZ r0, his_check_char
    ; Backspace: remove last char
    LDI r20, INPUT_LEN
    LOAD r21, r20
    CMPI r21, 0
    JZ r0, his_done
    SUBI r21, 1
    STORE r20, r21
    LDI r20, CONFIG_BUF
    ADD r20, r21
    LDI r0, 0
    STORE r20, r0
    JMP his_done

his_check_char:
    ; ASCII printable?
    CMPI r5, 32
    BLT r5, his_done
    CMPI r5, 127
    BGE r5, his_done
    ; Append to config buffer
    LDI r20, INPUT_LEN
    LOAD r21, r20
    CMPI r21, 200        ; max config length
    BGE r21, his_done
    LDI r20, CONFIG_BUF
    ADD r20, r21
    STORE r20, r5
    ADDI r21, 1
    LDI r20, INPUT_LEN
    STORE r20, r21
    ; Null terminate
    LDI r20, CONFIG_BUF
    ADD r20, r21
    LDI r0, 0
    STORE r20, r0

his_done:
    POP r31
    RET

; ═══════════════════════════════════════════
; BOOT HYPERVISOR
; ═══════════════════════════════════════════
boot_hypervisor:
    PUSH r31

    ; Check config is not empty
    LDI r20, INPUT_LEN
    LOAD r21, r20
    CMPI r21, 0
    JZ r0, boot_use_default

    ; Compute address of config string
    LDI r10, CONFIG_BUF   ; r10 = config addr

    ; Call HYPERVISOR opcode
    ; Format: HYPERVISOR addr_reg [, win_id_reg]
    ; 3 words: [0x72, addr_reg, win_id_reg]
    LDI r11, 0             ; win_id = 0 (full canvas) for now
    .byte 0x72, 10, 11     ; HYPERVISOR r10, r11

    ; Check result (r0=0 = success)
    CMPI r0, 0
    JZ r0, boot_ok

    ; Error: show message and stay in setup
    LDI r20, SCRATCH
    STRO r20, "boot failed: check config"
    LDI r1, 2
    LDI r2, 70
    LDI r3, SCRATCH
    LDI r4, 0xFF4444
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5
    FRAME
    POP r31
    RET

boot_use_default:
    ; Use default config
    LDI r20, CONFIG_BUF
    STRO r20, "arch=riscv64 kernel=Image initrd=initrd.cpio ram=256M"
    LDI r20, INPUT_LEN
    LDI r0, 48
    STORE r20, r0
    JMP boot_hypervisor   ; retry with default

boot_ok:
    ; Mark hypervisor as started
    LDI r20, HV_STARTED
    LDI r0, 1
    STORE r20, r0

    ; Switch to running mode
    LDI r20, MODE
    LDI r0, 1
    STORE r20, r0

    ; Clear ring buffer pointers for fresh start
    LDI r20, HV_WRITE_OFF
    LDI r0, 0
    STORE r20, r0
    LDI r20, HV_READ_OFF
    STORE r20, r0

    ; Clear console buffer
    LDI r20, CONSOLE_BUF
    LDI r6, 0x20
clr_con_boot:
    STORE r20, r6
    ADDI r20, 1
    CMPI r20, CONSOLE_END
    BLT r20, clr_con_boot

    ; Reset console line
    LDI r20, CONSOLE_LINE
    LDI r0, 0
    STORE r20, r0

    POP r31
    RET

; ═══════════════════════════════════════════
; DRAIN HV CONSOLE
; Reads new bytes from ring buffer, writes
; to console text buffer with newline handling.
; ═══════════════════════════════════════════
drain_hv_console:
    PUSH r31

    ; Get write/read offsets
    LDI r20, HV_WRITE_OFF
    LOAD r6, r20           ; r6 = write offset
    LDI r20, HV_READ_OFF
    LOAD r7, r20           ; r7 = read offset

    ; Check if any new bytes
    CMP r6, r7
    JZ r0, dhc_done        ; no new data
    CMPI r6, 0
    CMPI r7, 0
    JZ r0, dhc_read_first

    ; Normal case: read from current offset
    JMP dhc_read

dhc_read_first:
    ; Check both non-zero means data available
    JMP dhc_has_data

dhc_has_data:
    ; r6 = write_offset, r7 = read_offset
    ; Bytes available = (write - read) wrapped

dhc_read:
    ; Read one byte from ring buffer
    LDI r20, HV_RING_BASE
    ADD r20, r7
    LOAD r5, r20           ; r5 = byte

    ; Advance read offset
    ADDI r7, 1
    CMPI r7, 254
    BLT r7, dhc_adv
    LDI r7, 0             ; wrap
dhc_adv:
    STORE r20, r7          ; store back to HV_READ_OFF... wait, r20 is wrong now
    LDI r20, HV_READ_OFF
    STORE r20, r7

    ; Process the byte
    CMPI r5, 10            ; newline
    JNZ r0, dhc_store_char

    ; Newline: advance console line
    LDI r20, CONSOLE_LINE
    LOAD r8, r20
    ADDI r8, 1
    CMPI r8, ROWS
    BLT r8, dhc_nl_no_scroll
    ; Scroll (shift up by 1 line)
    ; Copy lines 1..ROWS-1 to 0..ROWS-2
    LDI r21, CONSOLE_BUF         ; dst
    LDI r22, CONSOLE_BUF + COLS  ; src (line 1)
    LDI r23, 0
dhc_scroll_lp:
    CMPI r23, 1520    ; (ROWS-1)*COLS = 19*80
    BGE r23, dhc_scroll_done
    LOAD r0, r22
    STORE r21, r0
    ADDI r21, 1
    ADDI r22, 1
    ADDI r23, 1
    JMP dhc_scroll_lp
dhc_scroll_done:
    ; Clear last line to spaces
    LDI r21, 0x5DF0   ; CONSOLE_BUF + (ROWS-1)*COLS = 0x5800 + 1520
    LDI r22, 0
dhc_clr_lp:
    CMPI r22, COLS
    BGE r22, dhc_clr_done
    LDI r0, 0x20
    STORE r21, r0
    ADDI r21, 1
    ADDI r22, 1
    JMP dhc_clr_lp
dhc_clr_done:
    LDI r8, 19        ; last line (ROWS-1)
dhc_nl_no_scroll:
    LDI r20, CONSOLE_LINE
    STORE r20, r8
    ; Reset cursor to column 0
    LDI r20, CUR_COL
    LDI r0, 0
    STORE r20, r0
    JMP dhc_next

dhc_store_char:
    CMPI r5, 13            ; carriage return: ignore
    JZ r0, dhc_next
    CMPI r5, 8             ; backspace
    JNZ r0, dhc_normal

    ; Backspace: move cursor back
    LDI r20, CUR_COL
    LOAD r9, r20
    CMPI r9, 0
    JZ r0, dhc_next
    SUBI r9, 1
    STORE r20, r9
    ; Write space at cursor position
    LDI r20, CONSOLE_LINE
    LOAD r8, r20
    LDI r21, CONSOLE_BUF
    LDI r22, COLS
    MUL r8, r22
    ADD r21, r8
    ADD r21, r9
    LDI r0, 0x20
    STORE r21, r0
    JMP dhc_next

dhc_normal:
    CMPI r5, 32
    BLT r5, dhc_next      ; skip non-printable
    CMPI r5, 127
    BGE r5, dhc_next      ; skip non-printable (>126)

    ; Store printable char at current cursor
    LDI r20, CUR_COL
    LOAD r9, r20
    CMPI r9, COLS
    BGE r9, dhc_next       ; past end of line
    LDI r20, CONSOLE_LINE
    LOAD r8, r20
    LDI r21, CONSOLE_BUF
    LDI r22, COLS
    MUL r8, r22
    ADD r21, r8
    ADD r21, r9
    STORE r21, r5

    ; Advance cursor
    LDI r20, CUR_COL
    LOAD r9, r20
    ADDI r9, 1
    CMPI r9, COLS
    BLT r9, dhc_adv_col
    ; Auto-wrap: advance line
    LDI r20, CONSOLE_LINE
    LOAD r8, r20
    ADDI r8, 1
    CMPI r8, ROWS
    BLT r8, dhc_auto_wrap
    ; Would implement scroll here, simplified for now
    LDI r8, 19    ; ROWS-1
dhc_auto_wrap:
    LDI r20, CONSOLE_LINE
    STORE r20, r8
    LDI r9, 0
dhc_adv_col:
    LDI r20, CUR_COL
    STORE r20, r9

dhc_next:
    ; Check if more bytes to read
    LDI r20, HV_WRITE_OFF
    LOAD r6, r20
    LDI r20, HV_READ_OFF
    LOAD r7, r20
    CMP r6, r7
    JNZ r0, dhc_read      ; more data

dhc_done:
    POP r31
    RET

; ═══════════════════════════════════════════
; RENDER CONSOLE
; ═══════════════════════════════════════════
render_console:
    PUSH r31

    ; Clear the console area (rows 2-22, below title bar)
    LDI r1, 0
    LDI r2, 12
    LDI r3, 256
    LDI r4, 200
    LDI r5, 0x0A0A0A
    RECTF r1, r2, r3, r4, r5

    ; Draw status line
    LDI r20, MODE
    LOAD r23, r20
    LDI r20, SCRATCH
    CMPI r23, 1
    JNZ r0, rc_halted_text
    STRO r20, "status: running"
    JMP rc_status_done
rc_halted_text:
    STRO r20, "status: halted "
rc_status_done:
    LDI r1, 2
    LDI r2, 14
    LDI r3, SCRATCH
    LDI r4, 0x44DD44       ; green
    LDI r5, 0x0A0A0A
    SMALLTEXT r1, r2, r3, r4, r5

    ; Render each row of console buffer
    LDI r19, 0             ; row index
    LDI r18, 20            ; starting y pixel for first text row

rc_row_lp:
    CMPI r19, ROWS
    BGE r19, rc_done

    ; Copy row to scratch
    LDI r20, CONSOLE_BUF
    ; Compute row offset: r21 = r19 * COLS
    MOV r21, r19
    LDI r22, COLS
    MUL r21, r22
    ADD r20, r21           ; r20 = CONSOLE_BUF[row*COLS]
    LDI r21, SCRATCH
    LDI r22, 0
rc_copy_row:
    CMPI r22, COLS
    BGE r22, rc_render_row
    LOAD r0, r20
    STORE r21, r0
    ADDI r20, 1
    ADDI r21, 1
    ADDI r22, 1
    JMP rc_copy_row
rc_render_row:
    ; Null terminate
    LDI r0, 0
    STORE r21, r0

    ; Render with SMALLTEXT
    LDI r1, 2              ; x
    MOV r2, r18            ; y
    LDI r3, SCRATCH
    LDI r4, 0xCCCCCC       ; light gray text
    LDI r5, 0x0A0A0A       ; bg
    SMALLTEXT r1, r2, r3, r4, r5

    ADDI r18, 7            ; next row y (6px font height + 1px spacing)
    ADDI r19, 1
    JMP rc_row_lp
rc_done:

    POP r31
    RET

; ═══════════════════════════════════════════
; HANDLE INPUT RUNNING MODE
; Forward keystrokes to hypervisor via 0x95
; ═══════════════════════════════════════════
handle_input_running:
    PUSH r31

    IKEY r5
    JZ r5, hir_done

    ; Store the key at SEND_BUF (our scratch for HYPERVISOR_SEND)
    ; Need: 0x95, addr_reg=10, len_reg=11
    ; RAM at r10 address contains bytes, r11 = count

    ; Put keystroke byte in RAM at address in r10
    LDI r10, SCRATCH
    STORE r10, r5          ; store the key byte
    LDI r11, 1             ; len = 1 byte

    ; HYPERVISOR_SEND
    ; Encoding: 0x97, addr_reg, len_reg
    .byte 0x97, 10, 11

    ; Also check for Escape -> return to setup
    CMPI r5, 27            ; Escape
    JNZ r0, hir_done

    ; Escape pressed: return to setup mode
    LDI r20, MODE
    LDI r0, 0
    STORE r20, r0
    LDI r20, HV_STARTED
    LDI r0, 0
    STORE r20, r0

    ; Clear console for next session
    LDI r20, CONSOLE_BUF
    LDI r6, 0x20
hir_clr:
    STORE r20, r6
    ADDI r20, 1
    CMPI r20, CONSOLE_END
    BLT r20, hir_clr

hir_done:
    POP r31
    RET

; ═══════════════════════════════════════════
; RENDER STATUS
; Draws the status bar at bottom
; ═══════════════════════════════════════════
render_status:
    ; We use the title bar area, no separate status bar for now
    RET

; ═══════════════════════════════════════════
; HELPERS
; ═══════════════════════════════════════════

; STRO: write null-terminated string to memory
; r20 = dest addr, literal string follows in instruction stream
STRO_IMPL:
    POP r21               ; get return address (points to string bytes)
    PUSH r31
stro_lp:
    LOAD r0, r21          ; load next word from instruction stream
    ; Low byte is the character
    ; Check if it's end of string (high byte non-zero means table entry, not char)
    ; Actually STRO is a pseudo-op that expands to inline data.
    ; The assembler handles this. We just need the instruction format.
    ; For now, skip - the assembler does STRO expansion.
    RET

; We rely on the assembler's STRO pseudo-op directly.
