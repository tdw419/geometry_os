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
LDI r0, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r0
LDI r21, 49
STORE r20, r21
ADD r20, r0
LDI r21, 50
STORE r20, r21
ADD r20, r0
LDI r21, 51
STORE r20, r21
ADD r20, r0
LDI r21, 52
STORE r20, r21
ADD r20, r0
LDI r21, 53
STORE r20, r21
ADD r20, r0
LDI r21, 54
STORE r20, r21
ADD r20, r0
LDI r21, 55
STORE r20, r21
ADD r20, r0
LDI r21, 56
STORE r20, r21
ADD r20, r0
LDI r21, 57
STORE r20, r21
ADD r20, r0
LDI r21, 65
STORE r20, r21
ADD r20, r0
LDI r21, 66
STORE r20, r21
ADD r20, r0
LDI r21, 67
STORE r20, r21
ADD r20, r0
LDI r21, 68
STORE r20, r21
ADD r20, r0
LDI r21, 69
STORE r20, r21
ADD r20, r0
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r15, 0x2000
STORE r20, r15
LDI r20, ROW_SCROLL
LDI r15, 0
STORE r20, r15

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r0
LDI r21, 101
STORE r20, r21
ADD r20, r0
LDI r21, 108
STORE r20, r21
ADD r20, r0
LDI r21, 108
STORE r20, r21
ADD r20, r0
LDI r21, 111
STORE r20, r21
ADD r20, r0
LDI r21, 44
STORE r20, r21
ADD r20, r0
LDI r21, 32
STORE r20, r21
ADD r20, r0
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r9

  LDI r2, 38
  CMP r9, r2
  JZ r8, do_up

  LDI r2, 40
  CMP r9, r2
  JZ r8, do_down

  ; Number keys 0-9
  LDI r2, 48
  CMP r9, r2
  BLT r8, do_draw

  LDI r2, 58
  CMP r9, r2
  BGE r8, do_draw

  LDI r2, 48
  SUB r9, r2
  LDI r2, 256
  MUL r9, r2
  LDI r20, VIEW_ADDR
  STORE r20, r9
  LDI r20, ROW_SCROLL
  LDI r15, 0
  STORE r20, r15
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r15, r20
  LDI r2, 0
  CMP r15, r2
  JZ r8, do_draw
  SUB r15, r0
  STORE r20, r15
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r15, r20
  ADD r15, r0
  LDI r2, 32
  CMP r15, r2
  BGE r8, do_draw
  STORE r20, r15
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r3, 0x080818
  FILL r3

  ; Title bar
  LDI r3, 0
  LDI r1, 0
  LDI r6, 256
  LDI r13, 16
  LDI r7, 0x004488
  RECTF r3, r1, r6, r13, r7

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r3, 30
  LDI r1, 3
  LDI r6, BUF
  LDI r13, 0xFFFFFF
  LDI r7, 0x004488
  DRAWTEXT r3, r1, r6, r13, r7

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r10, r20
  LDI r20, ROW_SCROLL
  LOAD r14, r20
  LDI r2, 8
  MUL r14, r2
  ADD r10, r14          ; r10 = start addr for display

  ; Draw 14 hex dump rows
  LDI r5, 0            ; row counter
  LDI r4, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r10 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r14, r10
  MOV r16, r22
  SHR r14, r16
  LDI r16, 0xF
  AND r14, r16
  LDI r16, HEX_TABLE
  ADD r16, r14
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r0
  SUB r22, r0
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
  MOV r14, r10
  LDI r16, 12
  SHR r14, r16
  LDI r16, 0xF
  AND r14, r16
  LDI r16, HEX_TABLE
  ADD r16, r14
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r0

  ; Nibble 2 (bits 11:8)
  MOV r14, r10
  LDI r16, 8
  SHR r14, r16
  LDI r16, 0xF
  AND r14, r16
  LDI r16, HEX_TABLE
  ADD r16, r14
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r0

  ; Nibble 1 (bits 7:4)
  MOV r14, r10
  LDI r16, 4
  SHR r14, r16
  LDI r16, 0xF
  AND r14, r16
  LDI r16, HEX_TABLE
  ADD r16, r14
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r0

  ; Nibble 0 (bits 3:0)
  MOV r14, r10
  LDI r16, 0xF
  AND r14, r16
  LDI r16, HEX_TABLE
  ADD r16, r14
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r0

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r0
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r0

  ; Read 8 bytes, write hex
  MOV r26, r10
  LDI r25, 0
nxt_byte:
  LOAD r15, r26

  ; High nibble
  LDI r3, 4
  SHR r15, r3
  LDI r3, 0xF
  AND r15, r3
  LDI r3, HEX_TABLE
  ADD r3, r15
  LOAD r3, r3
  STORE r21, r3
  ADD r21, r0

  ; Low nibble
  LOAD r15, r26
  LDI r3, 0xF
  AND r15, r3
  LDI r3, HEX_TABLE
  ADD r3, r15
  LOAD r3, r3
  STORE r21, r3
  ADD r21, r0

  ; Space
  LDI r3, 32
  STORE r21, r3
  ADD r21, r0

  ADD r26, r0
  ADD r25, r0
  LDI r3, 8
  CMP r25, r3
  BLT r8, nxt_byte

  ; " |" separator
  LDI r3, 32
  STORE r21, r3
  ADD r21, r0
  LDI r3, 124          ; '|'
  STORE r21, r3
  ADD r21, r0

  ; ASCII
  MOV r26, r10
  LDI r25, 0
nxt_ascii:
  LOAD r15, r26
  LDI r3, 32
  CMP r15, r3
  BLT r8, put_dot
  LDI r3, 127
  CMP r15, r3
  BGE r8, put_dot
  STORE r21, r15
  JMP nxt_asc2
put_dot:
  LDI r3, 46
  STORE r21, r3
nxt_asc2:
  ADD r21, r0
  ADD r26, r0
  ADD r25, r0
  LDI r3, 8
  CMP r25, r3
  BLT r8, nxt_ascii

  ; Trailing | and null
  LDI r3, 124
  STORE r21, r3
  ADD r21, r0
  LDI r3, 0
  STORE r21, r3

  ; Draw
  LDI r3, 2
  MOV r1, r4
  LDI r6, BUF
  LDI r13, 0xCCCCCC
  LDI r7, 0x080818
  DRAWTEXT r3, r1, r6, r13, r7

  ; Advance by 8
  LDI r2, 8
  ADD r10, r2
  LDI r2, 15
  ADD r4, r2
  ADD r5, r0
  LDI r2, 14
  CMP r5, r2
  BLT r8, nxt_row

  ; Status bar
  LDI r3, 0
  LDI r1, 236
  LDI r6, 256
  LDI r13, 20
  LDI r7, 0x1A1A2E
  RECTF r3, r1, r6, r13, r7

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r3, 4
  LDI r1, 238
  LDI r6, BUF
  LDI r13, 0x888888
  LDI r7, 0x1A1A2E
  DRAWTEXT r3, r1, r6, r13, r7

  FRAME
  JMP main_loop
