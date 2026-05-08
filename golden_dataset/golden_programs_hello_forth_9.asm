; DESCRIPTION: Draw square: pos=the screen, color=red, size=fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r0, 32
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 72
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 101
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 108
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 108
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 111
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 32
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 102
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 114
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 111
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 109
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 32
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 70
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 111
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 114
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 116
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 104
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 33
  LDI r6, 0xFFB
  STORE r6, r0    ; emit char
  LDI r0, 10
  LDI r6, 0xFFB
  STORE r6, r0    ; newline
RET
word_1:
; : SQUARE 
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r12, [r30]       ; TOS
  LDI r0, 1
  ADD r30, r0          ; SP++
  LOAD r9, [r30]       ; NOS
  MUL r12, r9           ; TOS * NOS
  STORE [r30], r12
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r0, [r30]       ; pop number
  LDI r9, 1
  ADD r30, r9
  LDI r6, 0xFFB
  STORE r6, r0    ; write to debug port
  LDI r0, 10
  LDI r6, 0xFFB
  STORE r6, r0    ; newline
  LDI r0, 1
  LOAD r9, [r30]
  SUB r9, r0
  STORE [r30], r9
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r0, [r30]
  CMPI r0, 0
  JZ r7, zerogt_4_false
  LDI r0, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r0, 0
  zerogt_4_done:
  STORE [r30], r0
  LOAD r0, [r30]       ; pop condition
  LDI r9, 1
  ADD r30, r9
  CMPI r0, 0
  JZ r7, begin_3
  LDI r7, 1
  ADD r30, r7          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 53
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 115
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 113
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 117
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 97
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 114
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 101
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 100
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 61
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 5
PUSH r0
CALL word_1
; (call SQUARE)
LOAD r0, [r30]       ; pop number
LDI r9, 1
ADD r30, r9
LDI r6, 0xFFB
STORE r6, r0    ; write to debug port
LDI r0, 10
LDI r6, 0xFFB
STORE r6, r0    ; newline
; dotquote:  Countdown from 5:
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 67
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 111
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 117
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 110
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 116
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 100
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 111
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 119
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 110
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 102
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 114
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 111
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 109
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 32
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 53
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 58
LDI r6, 0xFFB
STORE r6, r0    ; emit char
LDI r0, 10
LDI r6, 0xFFB
STORE r6, r0    ; newline
LDI r0, 5
PUSH r0
CALL word_2
; (call COUNTDOWN)
HALT