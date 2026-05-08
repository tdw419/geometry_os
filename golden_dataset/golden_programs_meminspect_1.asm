; DESCRIPTION: This GeOS assembly code initializes a memory inspector tool that displays a hex dump of RAM regions with ASCII characters alongside. It allows scrolling through memory using arrow keys and jumping to specific addresses using number keys. The code sets up a hex digit lookup table, initializes the display state, and enters a main loop where it continuously reads input, updates the view address, and redraws the screen with the current memory contents.

; meminspect.asm -- Memory Inspector for Geometry OS
;
; Phase 76: Memory Inspector
;
; Hex dump of RAM regions with ASCII alongside hex.
; Arrow keys to scroll, number keys 0-9 jump to addr*256.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x640F   Hex digit lookup
;   0x6500          Current view address
;   0x6501          Scroll offset (rows)
;
; Screen: 14 rows of 8 bytes with hex + ASCII

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define VIEW_ADDR 0x6500
#define ROW_SCROLL 0x6501

LDI r30, 0xFD00
LDI r6, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r6
LDI r21, 49
STORE r20, r21
ADD r20, r6
LDI r21, 50
STORE r20, r21
ADD r20, r6
LDI r21, 51
STORE r20, r21
ADD r20, r6
LDI r21, 52
STORE r20, r21
ADD r20, r6
LDI r21, 53
STORE r20, r21
ADD r20, r6
LDI r21, 54
STORE r20, r21
ADD r20, r6
LDI r21, 55
STORE r20, r21
ADD r20, r6
LDI r21, 56
STORE r20, r21
ADD r20, r6
LDI r21, 57
STORE r20, r21
ADD r20, r6
LDI r21, 65
STORE r20, r21
ADD r20, r6
LDI r21, 66
STORE r20, r21
ADD r20, r6
LDI r21, 67
STORE r20, r21
ADD r20, r6
LDI r21, 68
STORE r20, r21
ADD r20, r6
LDI r21, 69
STORE r20, r21
ADD r20, r6
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r4, 0x2000
STORE r20, r4
LDI r20, ROW_SCROLL
LDI r4, 0
STORE r20, r4

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r6
LDI r21, 101
STORE r20, r21
ADD r20, r6
LDI r21, 108
STORE r20, r21
ADD r20, r6
LDI r21, 108
STORE r20, r21
ADD r20, r6
LDI r21, 111
STORE r20, r21
ADD r20, r6
LDI r21, 44
STORE r20, r21
ADD r20, r6
LDI r21, 32
STORE r20, r21
ADD r20, r6
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r14

  LDI r3, 38
  CMP r14, r3
  JZ r8, do_up

  LDI r3, 40
  CMP r14, r3
  JZ r8, do_down

  ; Number keys 0-9
  LDI r3, 48
  CMP r14, r3
  BLT r8, do_draw

  LDI r3, 58
  CMP r14, r3
  BGE r8, do_draw

  LDI r3, 48
  SUB r14, r3
  LDI r3, 256
  MUL r14, r3
  LDI r20, VIEW_ADDR
  STORE r20, r14
  LDI r20, ROW_SCROLL
  LDI r4, 0
  STORE r20, r4
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r4, r20
  LDI r3, 0
  CMP r4, r3
  JZ r8, do_draw
  SUB r4, r6
  STORE r20, r4
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r4, r20
  ADD r4, r6
  LDI r3, 32
  CMP r4, r3
  BGE r8, do_draw
  STORE r20, r4
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r11, 0x080818
  FILL r11

  ; Title bar
  LDI r11, 0
  LDI r2, 0
  LDI r10, 256
  LDI r12, 16
  LDI r15, 0x004488
  RECTF r11, r2, r10, r12, r15

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r11, 30
  LDI r2, 3
  LDI r10, BUF
  LDI r12, 0xFFFFFF
  LDI r15, 0x004488
  DRAWTEXT r11, r2, r10, r12, r15

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r0, r20
  LDI r20, ROW_SCROLL
  LOAD r9, r20
  LDI r3, 8
  MUL r9, r3
  ADD r0, r9          ; r0 = start addr for display

  ; Draw 14 hex dump rows
  LDI r5, 0            ; row counter
  LDI r13, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r0 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r9, r0
  MOV r16, r22
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6
  SUB r22, r6
  LDI r16, 0
  CMP r22, r16
  BLT r8, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r8, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r9, r0
  LDI r16, 12
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 2 (bits 11:8)
  MOV r9, r0
  LDI r16, 8
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 1 (bits 7:4)
  MOV r9, r0
  LDI r16, 4
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 0 (bits 3:0)
  MOV r9, r0
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r6
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r6

  ; Read 8 bytes, write hex
  MOV r26, r0
  LDI r25, 0
nxt_byte:
  LOAD r4, r26

  ; High nibble
  LDI r11, 4
  SHR r4, r11
  LDI r11, 0xF
  AND r4, r11
  LDI r11, HEX_TABLE
  ADD r11, r4
  LOAD r11, r11
  STORE r21, r11
  ADD r21, r6

  ; Low nibble
  LOAD r4, r26
  LDI r11, 0xF
  AND r4, r11
  LDI r11, HEX_TABLE
  ADD r11, r4
  LOAD r11, r11
  STORE r21, r11
  ADD r21, r6

  ; Space
  LDI r11, 32
  STORE r21, r11
  ADD r21, r6

  ADD r26, r6
  ADD r25, r6
  LDI r11, 8
  CMP r25, r11
  BLT r8, nxt_byte

  ; " |" separator
  LDI r11, 32
  STORE r21, r11
  ADD r21, r6
  LDI r11, 124          ; '|'
  STORE r21, r11
  ADD r21, r6

  ; ASCII
  MOV r26, r0
  LDI r25, 0
nxt_ascii:
  LOAD r4, r26
  LDI r11, 32
  CMP r4, r11
  BLT r8, put_dot
  LDI r11, 127
  CMP r4, r11
  BGE r8, put_dot
  STORE r21, r4
  JMP nxt_asc2
put_dot:
  LDI r11, 46
  STORE r21, r11
nxt_asc2:
  ADD r21, r6
  ADD r26, r6
  ADD r25, r6
  LDI r11, 8
  CMP r25, r11
  BLT r8, nxt_ascii

  ; Trailing | and null
  LDI r11, 124
  STORE r21, r11
  ADD r21, r6
  LDI r11, 0
  STORE r21, r11

  ; Draw
  LDI r11, 2
  MOV r2, r13
  LDI r10, BUF
  LDI r12, 0xCCCCCC
  LDI r15, 0x080818
  DRAWTEXT r11, r2, r10, r12, r15

  ; Advance by 8
  LDI r3, 8
  ADD r0, r3
  LDI r3, 15
  ADD r13, r3
  ADD r5, r6
  LDI r3, 14
  CMP r5, r3
  BLT r8, nxt_row

  ; Status bar
  LDI r11, 0
  LDI r2, 236
  LDI r10, 256
  LDI r12, 20
  LDI r15, 0x1A1A2E
  RECTF r11, r2, r10, r12, r15

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r11, 4
  LDI r2, 238
  LDI r10, BUF
  LDI r12, 0x888888
  LDI r15, 0x1A1A2E
  DRAWTEXT r11, r2, r10, r12, r15

  FRAME
  JMP main_loop
