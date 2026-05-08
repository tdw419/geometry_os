; DESCRIPTION: Render a red object at the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r3, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r8, 0             ; op=0 (inject key)
  LDI r2, 65            ; keycode = 65 ('A')
  LDI r5, 0             ; shift = 0
  AI_INJECT r8           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r12               ; r12 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r15, 0xFF00       ; green
  LDI r13, 0xFF0000     ; red
  LDI r7, 65           ; expected value
  CMP r12, r7
  JZ r1, key_ok

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
  RECTF r20, r21, r22, r23, r15

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r8, 1             ; op=1 (inject mouse move)
  LDI r2, 128           ; x = 128
  LDI r5, 128           ; y = 128
  AI_INJECT r8           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r8, 2             ; op=2 (inject mouse click)
  LDI r2, 100           ; x = 100
  LDI r5, 200           ; y = 200
  LDI r12, 2             ; button = 2 (click)
  AI_INJECT r8           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r15, 0x2000
  LDI r13, 72           ; 'H'
  STORE r15, r13
  MOV r7, r15
  ADD r7, r3           ; r7 = 0x2001
  LDI r13, 73           ; 'I'
  STORE r7, r13
  MOV r7, r15
  ADD r7, r3
  ADD r7, r3           ; r7 = 0x2002
  LDI r13, 0
  STORE r7, r13        ; null terminator

  ; Inject the text string
  LDI r8, 3             ; op=3 (inject text string)
  LDI r2, 0x2000        ; addr of null-terminated string
  AI_INJECT r8           ; inject "HI" -- r1 = count (2)

  ; Draw colored bar for each injected char
  LDI r6, 0x0000FF     ; blue
  LDI r15, 10           ; start x
  LDI r13, 10           ; y position
  LDI r7, 10           ; width
  LDI r11, 10           ; height
  LDI r10, 0            ; counter

draw_loop:
  CMP r10, r1            ; compare counter with injected count
  BGE r1, done
  RECTF r15, r13, r7, r11, r6
  LDI r16, 12
  ADD r15, r16           ; move x right
  ADD r10, r3            ; counter++
  JMP draw_loop

done:
  HALT
