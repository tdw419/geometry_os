; DESCRIPTION: Geometry OS program to draw a red object.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r0, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r3, 0             ; op=0 (inject key)
  LDI r7, 65            ; keycode = 65 ('A')
  LDI r15, 0             ; shift = 0
  AI_INJECT r3           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r9               ; r9 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r14, 0xFF00       ; green
  LDI r13, 0xFF0000     ; red
  LDI r12, 65           ; expected value
  CMP r9, r12
  JZ r10, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r13
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r14

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r3, 1             ; op=1 (inject mouse move)
  LDI r7, 128           ; x = 128
  LDI r15, 128           ; y = 128
  AI_INJECT r3           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r3, 2             ; op=2 (inject mouse click)
  LDI r7, 100           ; x = 100
  LDI r15, 200           ; y = 200
  LDI r9, 2             ; button = 2 (click)
  AI_INJECT r3           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r14, 0x2000
  LDI r13, 72           ; 'H'
  STORE r14, r13
  MOV r12, r14
  ADD r12, r0           ; r12 = 0x2001
  LDI r13, 73           ; 'I'
  STORE r12, r13
  MOV r12, r14
  ADD r12, r0
  ADD r12, r0           ; r12 = 0x2002
  LDI r13, 0
  STORE r12, r13        ; null terminator

  ; Inject the text string
  LDI r3, 3             ; op=3 (inject text string)
  LDI r7, 0x2000        ; addr of null-terminated string
  AI_INJECT r3           ; inject "HI" -- r10 = count (2)

  ; Draw colored bar for each injected char
  LDI r1, 0x0000FF     ; blue
  LDI r14, 10           ; start x
  LDI r13, 10           ; y position
  LDI r12, 10           ; width
  LDI r11, 10           ; height
  LDI r8, 0            ; counter

draw_loop:
  CMP r8, r10            ; compare counter with injected count
  BGE r10, done
  RECTF r14, r13, r12, r11, r1
  LDI r16, 12
  ADD r14, r16           ; move x right
  ADD r8, r0            ; counter++
  JMP draw_loop

done:
  HALT
