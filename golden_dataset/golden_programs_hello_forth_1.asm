; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r1, 32
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 72
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 101
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 108
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 108
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 111
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 32
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 102
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 114
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 111
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 109
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 32
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 70
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 111
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 114
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 116
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 104
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 33
  LDI r3, 0xFFB
  STORE r3, r1    ; emit char
  LDI r1, 10
  LDI r3, 0xFFB
  STORE r3, r1    ; newline
RET
word_1:
; : SQUARE 
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r13, [r30]       ; TOS
  LDI r1, 1
  ADD r30, r1          ; SP++
  LOAD r10, [r30]       ; NOS
  MUL r13, r10           ; TOS * NOS
  STORE [r30], r13
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r1, [r30]       ; pop number
  LDI r10, 1
  ADD r30, r10
  LDI r3, 0xFFB
  STORE r3, r1    ; write to debug port
  LDI r1, 10
  LDI r3, 0xFFB
  STORE r3, r1    ; newline
  LDI r1, 1
  LOAD r10, [r30]
  SUB r10, r1
  STORE [r30], r10
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r1, [r30]
  CMPI r1, 0
  JZ r0, zerogt_4_false
  LDI r1, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r1, 0
  zerogt_4_done:
  STORE [r30], r1
  LOAD r1, [r30]       ; pop condition
  LDI r10, 1
  ADD r30, r10
  CMPI r1, 0
  JZ r0, begin_3
  LDI r0, 1
  ADD r30, r0          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 53
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 115
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 113
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 117
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 97
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 114
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 101
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 100
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 61
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 5
PUSH r1
CALL word_1
; (call SQUARE)
LOAD r1, [r30]       ; pop number
LDI r10, 1
ADD r30, r10
LDI r3, 0xFFB
STORE r3, r1    ; write to debug port
LDI r1, 10
LDI r3, 0xFFB
STORE r3, r1    ; newline
; dotquote:  Countdown from 5:
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 67
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 111
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 117
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 110
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 116
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 100
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 111
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 119
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 110
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 102
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 114
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 111
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 109
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 32
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 53
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 58
LDI r3, 0xFFB
STORE r3, r1    ; emit char
LDI r1, 10
LDI r3, 0xFFB
STORE r3, r1    ; newline
LDI r1, 5
PUSH r1
CALL word_2
; (call COUNTDOWN)
HALT