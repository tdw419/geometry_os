; DESCRIPTION: Geometry OS program to draw a red square.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r12, 32
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 72
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 101
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 108
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 108
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 111
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 32
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 102
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 114
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 111
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 109
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 32
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 70
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 111
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 114
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 116
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 104
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 33
  LDI r5, 0xFFB
  STORE r5, r12    ; emit char
  LDI r12, 10
  LDI r5, 0xFFB
  STORE r5, r12    ; newline
RET
word_1:
; : SQUARE 
  LDI r12, 1
  LOAD r12, [r30]       ; DUP: peek TOS
  PUSH r12
  LOAD r11, [r30]       ; TOS
  LDI r12, 1
  ADD r30, r12          ; SP++
  LOAD r4, [r30]       ; NOS
  MUL r11, r4           ; TOS * NOS
  STORE [r30], r11
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r12, 1
  LOAD r12, [r30]       ; DUP: peek TOS
  PUSH r12
  LOAD r12, [r30]       ; pop number
  LDI r4, 1
  ADD r30, r4
  LDI r5, 0xFFB
  STORE r5, r12    ; write to debug port
  LDI r12, 10
  LDI r5, 0xFFB
  STORE r5, r12    ; newline
  LDI r12, 1
  LOAD r4, [r30]
  SUB r4, r12
  STORE [r30], r4
  LDI r12, 1
  LOAD r12, [r30]       ; DUP: peek TOS
  PUSH r12
  LOAD r12, [r30]
  CMPI r12, 0
  JZ r8, zerogt_4_false
  LDI r12, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r12, 0
  zerogt_4_done:
  STORE [r30], r12
  LOAD r12, [r30]       ; pop condition
  LDI r4, 1
  ADD r30, r4
  CMPI r12, 0
  JZ r8, begin_3
  LDI r8, 1
  ADD r30, r8          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 53
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 115
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 113
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 117
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 97
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 114
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 101
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 100
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 61
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 5
PUSH r12
CALL word_1
; (call SQUARE)
LOAD r12, [r30]       ; pop number
LDI r4, 1
ADD r30, r4
LDI r5, 0xFFB
STORE r5, r12    ; write to debug port
LDI r12, 10
LDI r5, 0xFFB
STORE r5, r12    ; newline
; dotquote:  Countdown from 5:
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 67
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 111
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 117
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 110
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 116
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 100
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 111
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 119
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 110
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 102
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 114
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 111
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 109
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 32
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 53
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 58
LDI r5, 0xFFB
STORE r5, r12    ; emit char
LDI r12, 10
LDI r5, 0xFFB
STORE r5, r12    ; newline
LDI r12, 5
PUSH r12
CALL word_2
; (call COUNTDOWN)
HALT