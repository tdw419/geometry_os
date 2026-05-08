; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r4, 100
  LDI r15, 200
  LDI r7, 300
  PUSH r4           ; push 100
  PUSH r15           ; push 200
  PUSH r7           ; push 300
  POP r9            ; r9 = 300 (top)
  POP r14            ; r14 = 200
  POP r2            ; r2 = 100
  LDI r1, 0x0200
  STORE r1, r9     ; RAM[0x0200] = 300
  LDI r1, 0x0201
  STORE r1, r14     ; RAM[0x0201] = 200
  LDI r1, 0x0202
  STORE r1, r2     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r4, 0
  PUSH r4           ; push 0
  LDI r4, 1
  PUSH r4           ; push 1
  LDI r4, 2
  PUSH r4           ; push 2
  POP r9            ; r9 = 2
  POP r14            ; r14 = 1
  POP r2            ; r2 = 0
  LDI r1, 0x0203
  STORE r1, r9     ; RAM[0x0203] = 2
  LDI r1, 0x0204
  STORE r1, r14     ; RAM[0x0204] = 1
  LDI r1, 0x0205
  STORE r1, r2     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r4, 42
  PUSH r4           ; push at SP = 0xFF00
  POP r9            ; r9 should be 42 if SP is correct
  LDI r1, 0x0206
  STORE r1, r9     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r4, 777
  PUSH r4           ; save 777
  LDI r4, 0         ; clobber r4
  ADD r4, r15        ; r4 = 0 + r15 (some garbage value)
  LDI r4, 0
  ADD r4, r7
  POP r9            ; r9 should still be 777
  LDI r1, 0x0207
  STORE r1, r9     ; RAM[0x0207] = 777

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
  ; Pop into r9 and accumulate sum
  LDI r9, 0
  POP r14
  ADD r9, r14        ; 50
  POP r14
  ADD r9, r14        ; 50+40=90
  POP r14
  ADD r9, r14        ; 90+30=120
  POP r14
  ADD r9, r14        ; 120+20=140
  POP r14
  ADD r9, r14        ; 140+10=150
  LDI r1, 0x0208
  STORE r1, r9     ; RAM[0x0208] = 150

  HALT
