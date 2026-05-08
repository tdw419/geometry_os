; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r3, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r8, 0             ; op=0 (inject key)
  LDI r5, 65            ; keycode = 65 ('A')
  LDI r11, 0             ; shift = 0
  AI_INJECT r8           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r7               ; r7 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r6, 0xFF00       ; green
  LDI r4, 0xFF0000     ; red
  LDI r12, 65           ; expected value
  CMP r7, r12
  JZ r15, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r4
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r6

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r8, 1             ; op=1 (inject mouse move)
  LDI r5, 128           ; x = 128
  LDI r11, 128           ; y = 128
  AI_INJECT r8           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r8, 2             ; op=2 (inject mouse click)
  LDI r5, 100           ; x = 100
  LDI r11, 200           ; y = 200
  LDI r7, 2             ; button = 2 (click)
  AI_INJECT r8           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r6, 0x2000
  LDI r4, 72           ; 'H'
  STORE r6, r4
  MOV r12, r6
  ADD r12, r3           ; r12 = 0x2001
  LDI r4, 73           ; 'I'
  STORE r12, r4
  MOV r12, r6
  ADD r12, r3
  ADD r12, r3           ; r12 = 0x2002
  LDI r4, 0
  STORE r12, r4        ; null terminator

  ; Inject the text string
  LDI r8, 3             ; op=3 (inject text string)
  LDI r5, 0x2000        ; addr of null-terminated string
  AI_INJECT r8           ; inject "HI" -- r15 = count (2)

  ; Draw colored bar for each injected char
  LDI r0, 0x0000FF     ; blue
  LDI r6, 10           ; start x
  LDI r4, 10           ; y position
  LDI r12, 10           ; width
  LDI r10, 10           ; height
  LDI r1, 0            ; counter

draw_loop:
  CMP r1, r15            ; compare counter with injected count
  BGE r15, done
  RECTF r6, r4, r12, r10, r0
  LDI r16, 12
  ADD r6, r16           ; move x right
  ADD r1, r3            ; counter++
  JMP draw_loop

done:
  HALT
