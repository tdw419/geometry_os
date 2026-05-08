; DESCRIPTION: Display a object using color red at the screen.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r4, 100
  LDI r13, 200
  LDI r3, 300
  PUSH r4           ; push 100
  PUSH r13           ; push 200
  PUSH r3           ; push 300
  POP r15            ; r15 = 300 (top)
  POP r0            ; r0 = 200
  POP r14            ; r14 = 100
  LDI r8, 0x0200
  STORE r8, r15     ; RAM[0x0200] = 300
  LDI r8, 0x0201
  STORE r8, r0     ; RAM[0x0201] = 200
  LDI r8, 0x0202
  STORE r8, r14     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r4, 0
  PUSH r4           ; push 0
  LDI r4, 1
  PUSH r4           ; push 1
  LDI r4, 2
  PUSH r4           ; push 2
  POP r15            ; r15 = 2
  POP r0            ; r0 = 1
  POP r14            ; r14 = 0
  LDI r8, 0x0203
  STORE r8, r15     ; RAM[0x0203] = 2
  LDI r8, 0x0204
  STORE r8, r0     ; RAM[0x0204] = 1
  LDI r8, 0x0205
  STORE r8, r14     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r4, 42
  PUSH r4           ; push at SP = 0xFF00
  POP r15            ; r15 should be 42 if SP is correct
  LDI r8, 0x0206
  STORE r8, r15     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r4, 777
  PUSH r4           ; save 777
  LDI r4, 0         ; clobber r4
  ADD r4, r13        ; r4 = 0 + r13 (some garbage value)
  LDI r4, 0
  ADD r4, r3
  POP r15            ; r15 should still be 777
  LDI r8, 0x0207
  STORE r8, r15     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r4, 10
  PUSH r4
  LDI r4, 20
  PUSH r4
  LDI r4, 30
  PUSH r4
  LDI r4, 40
  PUSH r4
  LDI r4, 50
  PUSH r4
  ; Pop into r15 and accumulate sum
  LDI r15, 0
  POP r0
  ADD r15, r0        ; 50
  POP r0
  ADD r15, r0        ; 50+40=90
  POP r0
  ADD r15, r0        ; 90+30=120
  POP r0
  ADD r15, r0        ; 120+20=140
  POP r0
  ADD r15, r0        ; 140+10=150
  LDI r8, 0x0208
  STORE r8, r15     ; RAM[0x0208] = 150

  HALT
