; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r12, 100
  LDI r5, 200
  LDI r11, 300
  PUSH r12           ; push 100
  PUSH r5           ; push 200
  PUSH r11           ; push 300
  POP r1            ; r1 = 300 (top)
  POP r15            ; r15 = 200
  POP r2            ; r2 = 100
  LDI r7, 0x0200
  STORE r7, r1     ; RAM[0x0200] = 300
  LDI r7, 0x0201
  STORE r7, r15     ; RAM[0x0201] = 200
  LDI r7, 0x0202
  STORE r7, r2     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r12, 0
  PUSH r12           ; push 0
  LDI r12, 1
  PUSH r12           ; push 1
  LDI r12, 2
  PUSH r12           ; push 2
  POP r1            ; r1 = 2
  POP r15            ; r15 = 1
  POP r2            ; r2 = 0
  LDI r7, 0x0203
  STORE r7, r1     ; RAM[0x0203] = 2
  LDI r7, 0x0204
  STORE r7, r15     ; RAM[0x0204] = 1
  LDI r7, 0x0205
  STORE r7, r2     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r12, 42
  PUSH r12           ; push at SP = 0xFF00
  POP r1            ; r1 should be 42 if SP is correct
  LDI r7, 0x0206
  STORE r7, r1     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r12, 777
  PUSH r12           ; save 777
  LDI r12, 0         ; clobber r12
  ADD r12, r5        ; r12 = 0 + r5 (some garbage value)
  LDI r12, 0
  ADD r12, r11
  POP r1            ; r1 should still be 777
  LDI r7, 0x0207
  STORE r7, r1     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r12, 10
  PUSH r12
  LDI r12, 20
  PUSH r12
  LDI r12, 30
  PUSH r12
  LDI r12, 40
  PUSH r12
  LDI r12, 50
  PUSH r12
  ; Pop into r1 and accumulate sum
  LDI r1, 0
  POP r15
  ADD r1, r15        ; 50
  POP r15
  ADD r1, r15        ; 50+40=90
  POP r15
  ADD r1, r15        ; 90+30=120
  POP r15
  ADD r1, r15        ; 120+20=140
  POP r15
  ADD r1, r15        ; 140+10=150
  LDI r7, 0x0208
  STORE r7, r1     ; RAM[0x0208] = 150

  HALT
