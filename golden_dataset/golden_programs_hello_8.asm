; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r7, 32
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 72
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 101
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 108
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 108
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 111
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 32
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 102
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 114
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 111
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 109
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 32
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 70
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 111
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 114
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 116
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 104
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 33
  LDI r2, 0xFFB
  STORE r2, r7    ; emit char
  LDI r7, 10
  LDI r2, 0xFFB
  STORE r2, r7    ; newline
RET
word_1:
; : SQUARE 
  LDI r7, 1
  LOAD r7, [r30]       ; DUP: peek TOS
  PUSH r7
  LOAD r4, [r30]       ; TOS
  LDI r7, 1
  ADD r30, r7          ; SP++
  LOAD r0, [r30]       ; NOS
  MUL r4, r0           ; TOS * NOS
  STORE [r30], r4
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r7, 1
  LOAD r7, [r30]       ; DUP: peek TOS
  PUSH r7
  LOAD r7, [r30]       ; pop number
  LDI r0, 1
  ADD r30, r0
  LDI r2, 0xFFB
  STORE r2, r7    ; write to debug port
  LDI r7, 10
  LDI r2, 0xFFB
  STORE r2, r7    ; newline
  LDI r7, 1
  LOAD r0, [r30]
  SUB r0, r7
  STORE [r30], r0
  LDI r7, 1
  LOAD r7, [r30]       ; DUP: peek TOS
  PUSH r7
  LOAD r7, [r30]
  CMPI r7, 0
  JZ r6, zerogt_4_false
  LDI r7, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r7, 0
  zerogt_4_done:
  STORE [r30], r7
  LOAD r7, [r30]       ; pop condition
  LDI r0, 1
  ADD r30, r0
  CMPI r7, 0
  JZ r6, begin_3
  LDI r6, 1
  ADD r30, r6          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 53
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 115
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 113
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 117
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 97
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 114
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 101
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 100
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 61
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 5
PUSH r7
CALL word_1
; (call SQUARE)
LOAD r7, [r30]       ; pop number
LDI r0, 1
ADD r30, r0
LDI r2, 0xFFB
STORE r2, r7    ; write to debug port
LDI r7, 10
LDI r2, 0xFFB
STORE r2, r7    ; newline
; dotquote:  Countdown from 5:
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 67
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 111
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 117
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 110
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 116
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 100
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 111
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 119
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 110
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 102
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 114
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 111
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 109
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 32
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 53
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 58
LDI r2, 0xFFB
STORE r2, r7    ; emit char
LDI r7, 10
LDI r2, 0xFFB
STORE r2, r7    ; newline
LDI r7, 5
PUSH r7
CALL word_2
; (call COUNTDOWN)
HALT