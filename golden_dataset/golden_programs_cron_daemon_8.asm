; DESCRIPTION: This GeOS assembly code implements a frame-based cron daemon that reads a schedule from the virtual file system (VFS) and spawns programs at regular intervals defined in a crontab file. The crontab format specifies intervals and program names, and the daemon manages up to eight scheduled entries, checking each frame to determine if a program should be executed.

; cron_daemon.asm -- Phase 101: Cron Daemon
;
; A frame-based cron daemon that reads a schedule from VFS and spawns
; programs at regular intervals. Like Unix cron but using frame counts.
;
; Crontab format: "interval program_name\n" per line (text)
; Example: "100 hello\n" means run hello.asm every 100 frames
;
; Memory layout:
;   0x1000: crontab filename string ("crontab")
;   0x2000: read buffer for crontab file contents
;   0x4000-0x43FF: schedule table (8 entries, 64 words each)
;     Entry: [interval(1), last_run(1), name_len(1), padding(1), name(60)]
;   0x5000: program name buffer for EXEC
;   0xFA0: reload flag
;
; Uses: LDI, STORE, LOAD, MOV, ADD, SUB, MUL, AND, CMP, BLT, BGE,
;   JZ, JNZ, JMP, CALL, RET, PUSH, POP, OPEN, READ, CLOSE, FRAME, EXEC

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Phase 1: Initialize
    ; Clear screen
    LDI r1, 0
    FILL r1

    ; Initialize stack pointer
    LDI r30, 0xFF00

    ; Write "crontab" filename to 0x1000
    LDI r9, 0x1000
    LDI r3, 99
    STORE r9, r3
    LDI r9, 0x1001
    LDI r3, 114
    STORE r9, r3
    LDI r9, 0x1002
    LDI r3, 111
    STORE r9, r3
    LDI r9, 0x1003
    LDI r3, 110
    STORE r9, r3
    LDI r9, 0x1004
    LDI r3, 116
    STORE r9, r3
    LDI r9, 0x1005
    LDI r3, 97
    STORE r9, r3
    LDI r9, 0x1006
    LDI r3, 98
    STORE r9, r3
    LDI r9, 0x1007
    LDI r3, 0
    STORE r9, r3

    ; Clear schedule table (512 words at 0x4000)
    LDI r9, 0x4000
    LDI r7, 0
    LDI r0, 0x4200
clear_table:
    STORE r9, r7
    LDI r11, 1
    ADD r9, r11
    CMP r9, r0
    BLT r1, clear_table

    ; ═══════════════════════════════════════════════════════════════
    ; Phase 2: Read and parse crontab
    ; ═══════════════════════════════════════════════════════════════
read_crontab:
    LDI r2, 0x1000
    LDI r5, 0
    OPEN r2, r5
    MOV r14, r1

    ; Check error
    LDI r9, 0xFFFFFFFF
    CMP r14, r9
    JZ r1, no_crontab

    ; Read into 0x2000
    LDI r12, 0x2000
    LDI r6, 512
    READ r14, r12, r6

    CLOSE r14

    ; Parse entries
    CALL parse_crontab

no_crontab:
    ; ═══════════════════════════════════════════════════════════════
    ; Phase 3: Main loop -- check schedule, spawn jobs
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    ; Get current TICKS
    LDI r9, 0xFFE
    LOAD r9, r9

    ; Check each entry (max 8)
    LDI r3, 0
check_entry:
    ; Entry base = 0x4000 + index * 64
    MOV r7, r3
    LDI r11, 64
    MUL r7, r11       ; r7 = index * 64
    LDI r11, 0x4000
    ADD r7, r11       ; r7 = 0x4000 + index * 64

    ; interval = entry[0]
    LOAD r13, r7
    JZ r13, next_entry

    ; last_run = entry[1]
    MOV r0, r7
    LDI r16, 1
    ADD r0, r16
    LOAD r16, r0

    ; elapsed = ticks - last_run
    MOV r17, r9
    SUB r17, r16
    CMP r17, r13
    BLT r1, next_entry

    ; Time to spawn! Copy name to 0x5000
    PUSH r31
    CALL copy_name
    POP r31

    ; EXEC
    LDI r2, 0x5000
    EXEC r2

    ; Update last_run
    STORE r0, r9

next_entry:
    LDI r11, 1
    ADD r3, r11
    LDI r11, 8
    CMP r3, r11
    BLT r1, check_entry

    ; Check reload flag
    LDI r9, 0xFA0
    LOAD r9, r9
    LDI r3, 0x43524F
    CMP r9, r3
    JNZ r1, skip_reload
    LDI r9, 0xFA0
    LDI r3, 0
    STORE r9, r3
    JMP read_crontab

skip_reload:
    FRAME
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; parse_crontab: Parse buffer at 0x2000 into table at 0x4000
; ═══════════════════════════════════════════════════════════════
parse_crontab:
    PUSH r31

    LDI r9, 0x2000    ; source ptr
    LDI r3, 0         ; entry index (0..7)

parse_line:
    ; Skip whitespace/newlines
skip_ws:
    LOAD r7, r9
    JZ r7, parse_done ; null = end
    LDI r11, 10
    CMP r7, r11
    JZ r1, advance_skip
    LDI r11, 13
    CMP r7, r11
    JZ r1, advance_skip
    LDI r11, 32
    CMP r7, r11
    JNZ r1, try_digit
advance_skip:
    LDI r11, 1
    ADD r9, r11
    JMP skip_ws

try_digit:
    ; Check if it's a digit (48-57)
    LDI r11, 48
    CMP r7, r11
    BLT r1, skip_line  ; < '0' -> skip line
    LDI r11, 58
    CMP r7, r11
    BGE r1, skip_line  ; > '9' -> skip line

    ; Parse decimal number into r13
    LDI r13, 0
    LDI r0, 10
parse_digit:
    ; r7 already loaded
    ; Check digit range
    LDI r16, 48
    CMP r7, r16
    BLT r1, got_interval
    LDI r16, 58
    CMP r7, r16
    BGE r1, got_interval

    ; r13 = r13 * 10 + (digit - 48)
    MUL r13, r0
    LDI r16, 48
    SUB r7, r16
    ADD r13, r7

    LDI r11, 1
    ADD r9, r11
    LOAD r7, r9
    JMP parse_digit

got_interval:
    ; Skip space after interval
    LDI r11, 32
    CMP r7, r11
    JNZ r1, skip_line  ; no space after interval = malformed
    LDI r11, 1
    ADD r9, r11       ; skip space

    ; Compute entry base
    LDI r0, 64
    MOV r16, r3
    MUL r16, r0
    LDI r17, 0x4000
    ADD r16, r17       ; r16 = entry base

    ; Store interval
    STORE r16, r13

    ; Store last_run = 0
    MOV r17, r16
    LDI r18, 1
    ADD r17, r18
    LDI r18, 0
    STORE r17, r18

    ; Copy name at offset 4
    MOV r17, r16
    LDI r18, 4
    ADD r17, r18       ; r17 = dest for name
    LDI r19, 0         ; name len

copy_name_char:
    LOAD r7, r9
    JZ r7, end_copy_name
    LDI r11, 10
    CMP r7, r11
    JZ r1, end_copy_name
    LDI r11, 13
    CMP r7, r11
    JZ r1, end_copy_name

    STORE r17, r7
    LDI r11, 1
    ADD r9, r11
    ADD r17, r11
    ADD r19, r11
    LDI r20, 56
    CMP r19, r20
    BGE r1, end_copy_name
    JMP copy_name_char

end_copy_name:
    ; Store name_len at offset 2
    MOV r17, r16
    LDI r18, 2
    ADD r17, r18
    STORE r17, r19

    ; Next entry
    LDI r11, 1
    ADD r3, r11
    LDI r11, 8
    CMP r3, r11
    BGE r1, parse_done

    ; Fall through to skip rest of line

skip_line:
    ; Skip to next newline or null
    LOAD r7, r9
    JZ r7, parse_done
    LDI r11, 10
    CMP r7, r11
    JZ r1, skip_newline
    LDI r11, 1
    ADD r9, r11
    JMP skip_line

skip_newline:
    LDI r11, 1
    ADD r9, r11
    JMP parse_line

parse_done:
    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; copy_name: Copy entry name to 0x5000 for EXEC
; Input: r7 = entry base, r16 clobbered
; ═══════════════════════════════════════════════════════════════
copy_name:
    PUSH r31

    ; Get name_len at offset 2
    MOV r16, r7
    LDI r17, 2
    ADD r16, r17
    LOAD r17, r16      ; r17 = name length

    ; Copy name from offset 4
    MOV r16, r7
    LDI r18, 4
    ADD r16, r18
    LDI r18, 0x5000
    LDI r19, 0

cpn_loop:
    CMP r19, r17
    BGE r1, cpn_done
    LOAD r20, r16
    STORE r18, r20
    LDI r20, 1
    ADD r16, r20
    ADD r18, r20
    ADD r19, r20
    JMP cpn_loop

cpn_done:
    LDI r20, 0
    STORE r18, r20

    POP r31
    RET
