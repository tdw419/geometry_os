; DESCRIPTION: A red square centered at the screen with fixed size.

; ai_vision.asm -- Phase 88: AI Vision Bridge demo
;
; Demonstrates the AI_AGENT opcode:
;   op=0: screenshot to VFS file
;   op=1: canvas checksum
;   op=3: vision API call (with mock response)
;
; The program draws red bars, takes a checksum,
; modifies the screen, takes another checksum, and calls the vision API.

; ── Draw red bars ──
LDI r6, 1
LDI r8, 0xFF0000   ; red
LDI r1, 0          ; y = 0
LDI r7, 256        ; screen width
LDI r3, 32         ; bar spacing

draw_loop:
  LDI r14, 0        ; x = 0
  draw_row:
    PSET r14, r1, r8
    ADD r14, r6     ; x++
    CMP r14, r7
    BLT r13, draw_row
  ADD r1, r6       ; y++
  CMP r1, r3
  BLT r13, draw_loop

; ── Get checksum before (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r13 = checksum
MOV r0, r13        ; save in r0

; ── Modify screen -- blue square ──
LDI r8, 0x0000FF   ; blue
LDI r1, 100
LDI r3, 156

fill_y:
  LDI r14, 100
  fill_x:
    PSET r14, r1, r8
    ADD r14, r6
    CMP r14, r3
    BLT r13, fill_x
  ADD r1, r6
  CMP r1, r3
  BLT r13, fill_y

; ── Get checksum after (op=1) ──
LDI r10, 1
AI_AGENT r10       ; r13 = new checksum
MOV r15, r13        ; save in r15

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r4, 0x5000
LDI r10, 0x64      ; 'd'
STORE r4, r10
LDI r12, 0x65      ; 'e'
MOV r10, r4
ADD r10, r6
STORE r10, r12
LDI r12, 0x73      ; 's'
MOV r10, r4
ADD r10, r6
ADD r10, r6
STORE r10, r12
LDI r12, 0x63      ; 'c'
MOV r10, r4
ADD r10, r6
ADD r10, r6
ADD r10, r6
STORE r10, r12
MOV r10, r4
ADD r10, r6
ADD r10, r6
ADD r10, r6
ADD r10, r6
LDI r12, 0
STORE r10, r12

; Set up registers for vision API
LDI r10, 3         ; op=3 (vision API)
MOV r11, r4       ; prompt addr
LDI r0, 0x6000    ; response addr
LDI r15, 256       ; max response length
AI_AGENT r10       ; r13 = response length

HALT
