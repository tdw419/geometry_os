; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r13, 32
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 72
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 101
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 108
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 108
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 111
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 32
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 102
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 114
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 111
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 109
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 32
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 70
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 111
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 114
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 116
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 104
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 33
  LDI r6, 0xFFB
  STORE r6, r13    ; emit char
  LDI r13, 10
  LDI r6, 0xFFB
  STORE r6, r13    ; newline
RET
word_1:
; : SQUARE 
  LDI r13, 1
  LOAD r13, [r30]       ; DUP: peek TOS
  PUSH r13
  LOAD r11, [r30]       ; TOS
  LDI r13, 1
  ADD r30, r13          ; SP++
  LOAD r1, [r30]       ; NOS
  MUL r11, r1           ; TOS * NOS
  STORE [r30], r11
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r13, 1
  LOAD r13, [r30]       ; DUP: peek TOS
  PUSH r13
  LOAD r13, [r30]       ; pop number
  LDI r1, 1
  ADD r30, r1
  LDI r6, 0xFFB
  STORE r6, r13    ; write to debug port
  LDI r13, 10
  LDI r6, 0xFFB
  STORE r6, r13    ; newline
  LDI r13, 1
  LOAD r1, [r30]
  SUB r1, r13
  STORE [r30], r1
  LDI r13, 1
  LOAD r13, [r30]       ; DUP: peek TOS
  PUSH r13
  LOAD r13, [r30]
  CMPI r13, 0
  JZ r2, zerogt_4_false
  LDI r13, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r13, 0
  zerogt_4_done:
  STORE [r30], r13
  LOAD r13, [r30]       ; pop condition
  LDI r1, 1
  ADD r30, r1
  CMPI r13, 0
  JZ r2, begin_3
  LDI r2, 1
  ADD r30, r2          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 53
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 115
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 113
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 117
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 97
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 114
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 101
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 100
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 61
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 5
PUSH r13
CALL word_1
; (call SQUARE)
LOAD r13, [r30]       ; pop number
LDI r1, 1
ADD r30, r1
LDI r6, 0xFFB
STORE r6, r13    ; write to debug port
LDI r13, 10
LDI r6, 0xFFB
STORE r6, r13    ; newline
; dotquote:  Countdown from 5:
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 67
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 111
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 117
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 110
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 116
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 100
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 111
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 119
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 110
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 102
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 114
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 111
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 109
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 32
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 53
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 58
LDI r6, 0xFFB
STORE r6, r13    ; emit char
LDI r13, 10
LDI r6, 0xFFB
STORE r6, r13    ; newline
LDI r13, 5
PUSH r13
CALL word_2
; (call COUNTDOWN)
HALT