; DESCRIPTION: The assembly code demonstrates the AI Vision Bridge functionality by drawing red bars on the screen, taking a checksum of the initial state, modifying the screen with a blue square, taking another checksum after modification, and making a mock call to the vision API with the prompt "desc". The program uses specific opcodes and registers to handle these tasks.

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
LDI r15, 1
LDI r12, 0xFF0000   ; red
LDI r10, 0          ; y = 0
LDI r5, 256        ; screen width
LDI r3, 32         ; bar spacing

draw_loop:
  LDI r8, 0        ; x = 0
  draw_row:
    PSET r8, r10, r12
    ADD r8, r15     ; x++
    CMP r8, r5
    BLT r13, draw_row
  ADD r10, r15       ; y++
  CMP r10, r3
  BLT r13, draw_loop

; ── Get checksum before (op=1) ──
LDI r1, 1
AI_AGENT r1       ; r13 = checksum
MOV r11, r13        ; save in r11

; ── Modify screen -- blue square ──
LDI r12, 0x0000FF   ; blue
LDI r10, 100
LDI r3, 156

fill_y:
  LDI r8, 100
  fill_x:
    PSET r8, r10, r12
    ADD r8, r15
    CMP r8, r3
    BLT r13, fill_x
  ADD r10, r15
  CMP r10, r3
  BLT r13, fill_y

; ── Get checksum after (op=1) ──
LDI r1, 1
AI_AGENT r1       ; r13 = new checksum
MOV r6, r13        ; save in r6

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r2, 0x5000
LDI r1, 0x64      ; 'd'
STORE r2, r1
LDI r7, 0x65      ; 'e'
MOV r1, r2
ADD r1, r15
STORE r1, r7
LDI r7, 0x73      ; 's'
MOV r1, r2
ADD r1, r15
ADD r1, r15
STORE r1, r7
LDI r7, 0x63      ; 'c'
MOV r1, r2
ADD r1, r15
ADD r1, r15
ADD r1, r15
STORE r1, r7
MOV r1, r2
ADD r1, r15
ADD r1, r15
ADD r1, r15
ADD r1, r15
LDI r7, 0
STORE r1, r7

; Set up registers for vision API
LDI r1, 3         ; op=3 (vision API)
MOV r4, r2       ; prompt addr
LDI r11, 0x6000    ; response addr
LDI r6, 256       ; max response length
AI_AGENT r1       ; r13 = response length

HALT
