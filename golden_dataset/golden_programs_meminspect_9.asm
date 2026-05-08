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
LDI r10, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r10
LDI r21, 49
STORE r20, r21
ADD r20, r10
LDI r21, 50
STORE r20, r21
ADD r20, r10
LDI r21, 51
STORE r20, r21
ADD r20, r10
LDI r21, 52
STORE r20, r21
ADD r20, r10
LDI r21, 53
STORE r20, r21
ADD r20, r10
LDI r21, 54
STORE r20, r21
ADD r20, r10
LDI r21, 55
STORE r20, r21
ADD r20, r10
LDI r21, 56
STORE r20, r21
ADD r20, r10
LDI r21, 57
STORE r20, r21
ADD r20, r10
LDI r21, 65
STORE r20, r21
ADD r20, r10
LDI r21, 66
STORE r20, r21
ADD r20, r10
LDI r21, 67
STORE r20, r21
ADD r20, r10
LDI r21, 68
STORE r20, r21
ADD r20, r10
LDI r21, 69
STORE r20, r21
ADD r20, r10
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r2, 0x2000
STORE r20, r2
LDI r20, ROW_SCROLL
LDI r2, 0
STORE r20, r2

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r10
LDI r21, 101
STORE r20, r21
ADD r20, r10
LDI r21, 108
STORE r20, r21
ADD r20, r10
LDI r21, 108
STORE r20, r21
ADD r20, r10
LDI r21, 111
STORE r20, r21
ADD r20, r10
LDI r21, 44
STORE r20, r21
ADD r20, r10
LDI r21, 32
STORE r20, r21
ADD r20, r10
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r8

  LDI r4, 38
  CMP r8, r4
  JZ r15, do_up

  LDI r4, 40
  CMP r8, r4
  JZ r15, do_down

  ; Number keys 0-9
  LDI r4, 48
  CMP r8, r4
  BLT r15, do_draw

  LDI r4, 58
  CMP r8, r4
  BGE r15, do_draw

  LDI r4, 48
  SUB r8, r4
  LDI r4, 256
  MUL r8, r4
  LDI r20, VIEW_ADDR
  STORE r20, r8
  LDI r20, ROW_SCROLL
  LDI r2, 0
  STORE r20, r2
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r2, r20
  LDI r4, 0
  CMP r2, r4
  JZ r15, do_draw
  SUB r2, r10
  STORE r20, r2
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r2, r20
  ADD r2, r10
  LDI r4, 32
  CMP r2, r4
  BGE r15, do_draw
  STORE r20, r2
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r6, 0x080818
  FILL r6

  ; Title bar
  LDI r6, 0
  LDI r9, 0
  LDI r13, 256
  LDI r11, 16
  LDI r3, 0x004488
  RECTF r6, r9, r13, r11, r3

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r6, 30
  LDI r9, 3
  LDI r13, BUF
  LDI r11, 0xFFFFFF
  LDI r3, 0x004488
  DRAWTEXT r6, r9, r13, r11, r3

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r12, r20
  LDI r20, ROW_SCROLL
  LOAD r0, r20
  LDI r4, 8
  MUL r0, r4
  ADD r12, r0          ; r12 = start addr for display

  ; Draw 14 hex dump rows
  LDI r7, 0            ; row counter
  LDI r14, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r12 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r0, r12
  MOV r16, r22
  SHR r0, r16
  LDI r16, 0xF
  AND r0, r16
  LDI r16, HEX_TABLE
  ADD r16, r0
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10
  SUB r22, r10
  LDI r16, 0
  CMP r22, r16
  BLT r15, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r15, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r0, r12
  LDI r16, 12
  SHR r0, r16
  LDI r16, 0xF
  AND r0, r16
  LDI r16, HEX_TABLE
  ADD r16, r0
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 2 (bits 11:8)
  MOV r0, r12
  LDI r16, 8
  SHR r0, r16
  LDI r16, 0xF
  AND r0, r16
  LDI r16, HEX_TABLE
  ADD r16, r0
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 1 (bits 7:4)
  MOV r0, r12
  LDI r16, 4
  SHR r0, r16
  LDI r16, 0xF
  AND r0, r16
  LDI r16, HEX_TABLE
  ADD r16, r0
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Nibble 0 (bits 3:0)
  MOV r0, r12
  LDI r16, 0xF
  AND r0, r16
  LDI r16, HEX_TABLE
  ADD r16, r0
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r10

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r10
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r10

  ; Read 8 bytes, write hex
  MOV r26, r12
  LDI r25, 0
nxt_byte:
  LOAD r2, r26

  ; High nibble
  LDI r6, 4
  SHR r2, r6
  LDI r6, 0xF
  AND r2, r6
  LDI r6, HEX_TABLE
  ADD r6, r2
  LOAD r6, r6
  STORE r21, r6
  ADD r21, r10

  ; Low nibble
  LOAD r2, r26
  LDI r6, 0xF
  AND r2, r6
  LDI r6, HEX_TABLE
  ADD r6, r2
  LOAD r6, r6
  STORE r21, r6
  ADD r21, r10

  ; Space
  LDI r6, 32
  STORE r21, r6
  ADD r21, r10

  ADD r26, r10
  ADD r25, r10
  LDI r6, 8
  CMP r25, r6
  BLT r15, nxt_byte

  ; " |" separator
  LDI r6, 32
  STORE r21, r6
  ADD r21, r10
  LDI r6, 124          ; '|'
  STORE r21, r6
  ADD r21, r10

  ; ASCII
  MOV r26, r12
  LDI r25, 0
nxt_ascii:
  LOAD r2, r26
  LDI r6, 32
  CMP r2, r6
  BLT r15, put_dot
  LDI r6, 127
  CMP r2, r6
  BGE r15, put_dot
  STORE r21, r2
  JMP nxt_asc2
put_dot:
  LDI r6, 46
  STORE r21, r6
nxt_asc2:
  ADD r21, r10
  ADD r26, r10
  ADD r25, r10
  LDI r6, 8
  CMP r25, r6
  BLT r15, nxt_ascii

  ; Trailing | and null
  LDI r6, 124
  STORE r21, r6
  ADD r21, r10
  LDI r6, 0
  STORE r21, r6

  ; Draw
  LDI r6, 2
  MOV r9, r14
  LDI r13, BUF
  LDI r11, 0xCCCCCC
  LDI r3, 0x080818
  DRAWTEXT r6, r9, r13, r11, r3

  ; Advance by 8
  LDI r4, 8
  ADD r12, r4
  LDI r4, 15
  ADD r14, r4
  ADD r7, r10
  LDI r4, 14
  CMP r7, r4
  BLT r15, nxt_row

  ; Status bar
  LDI r6, 0
  LDI r9, 236
  LDI r13, 256
  LDI r11, 20
  LDI r3, 0x1A1A2E
  RECTF r6, r9, r13, r11, r3

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r6, 4
  LDI r9, 238
  LDI r13, BUF
  LDI r11, 0x888888
  LDI r3, 0x1A1A2E
  DRAWTEXT r6, r9, r13, r11, r3

  FRAME
  JMP main_loop
