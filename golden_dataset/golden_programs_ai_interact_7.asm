; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r2, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r12, 0             ; op=0 (inject key)
  LDI r1, 65            ; keycode = 65 ('A')
  LDI r7, 0             ; shift = 0
  AI_INJECT r12           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r13               ; r13 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r0, 0xFF00       ; green
  LDI r10, 0xFF0000     ; red
  LDI r9, 65           ; expected value
  CMP r13, r9
  JZ r11, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r10
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r0

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r12, 1             ; op=1 (inject mouse move)
  LDI r1, 128           ; x = 128
  LDI r7, 128           ; y = 128
  AI_INJECT r12           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r12, 2             ; op=2 (inject mouse click)
  LDI r1, 100           ; x = 100
  LDI r7, 200           ; y = 200
  LDI r13, 2             ; button = 2 (click)
  AI_INJECT r12           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r0, 0x2000
  LDI r10, 72           ; 'H'
  STORE r0, r10
  MOV r9, r0
  ADD r9, r2           ; r9 = 0x2001
  LDI r10, 73           ; 'I'
  STORE r9, r10
  MOV r9, r0
  ADD r9, r2
  ADD r9, r2           ; r9 = 0x2002
  LDI r10, 0
  STORE r9, r10        ; null terminator

  ; Inject the text string
  LDI r12, 3             ; op=3 (inject text string)
  LDI r1, 0x2000        ; addr of null-terminated string
  AI_INJECT r12           ; inject "HI" -- r11 = count (2)

  ; Draw colored bar for each injected char
  LDI r8, 0x0000FF     ; blue
  LDI r0, 10           ; start x
  LDI r10, 10           ; y position
  LDI r9, 10           ; width
  LDI r5, 10           ; height
  LDI r15, 0            ; counter

draw_loop:
  CMP r15, r11            ; compare counter with injected count
  BGE r11, done
  RECTF r0, r10, r9, r5, r8
  LDI r16, 12
  ADD r0, r16           ; move x right
  ADD r15, r2            ; counter++
  JMP draw_loop

done:
  HALT
