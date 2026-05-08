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
LDI r0, 1
LDI r5, 0xFF0000   ; red
LDI r7, 0          ; y = 0
LDI r2, 256        ; screen width
LDI r10, 32         ; bar spacing

draw_loop:
  LDI r3, 0        ; x = 0
  draw_row:
    PSET r3, r7, r5
    ADD r3, r0     ; x++
    CMP r3, r2
    BLT r1, draw_row
  ADD r7, r0       ; y++
  CMP r7, r10
  BLT r1, draw_loop

; ── Get checksum before (op=1) ──
LDI r13, 1
AI_AGENT r13       ; r1 = checksum
MOV r9, r1        ; save in r9

; ── Modify screen -- blue square ──
LDI r5, 0x0000FF   ; blue
LDI r7, 100
LDI r10, 156

fill_y:
  LDI r3, 100
  fill_x:
    PSET r3, r7, r5
    ADD r3, r0
    CMP r3, r10
    BLT r1, fill_x
  ADD r7, r0
  CMP r7, r10
  BLT r1, fill_y

; ── Get checksum after (op=1) ──
LDI r13, 1
AI_AGENT r13       ; r1 = new checksum
MOV r6, r1        ; save in r6

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r8, 0x5000
LDI r13, 0x64      ; 'd'
STORE r8, r13
LDI r12, 0x65      ; 'e'
MOV r13, r8
ADD r13, r0
STORE r13, r12
LDI r12, 0x73      ; 's'
MOV r13, r8
ADD r13, r0
ADD r13, r0
STORE r13, r12
LDI r12, 0x63      ; 'c'
MOV r13, r8
ADD r13, r0
ADD r13, r0
ADD r13, r0
STORE r13, r12
MOV r13, r8
ADD r13, r0
ADD r13, r0
ADD r13, r0
ADD r13, r0
LDI r12, 0
STORE r13, r12

; Set up registers for vision API
LDI r13, 3         ; op=3 (vision API)
MOV r15, r8       ; prompt addr
LDI r9, 0x6000    ; response addr
LDI r6, 256       ; max response length
AI_AGENT r13       ; r1 = response length

HALT
