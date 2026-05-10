; DESCRIPTION: Places a magenta line segment connecting (493, 122) to (409, 86).
; PLAN: r0=493(x1), r1=122(y1), r2=409(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 122
LDI r2, 409
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
