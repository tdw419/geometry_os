; DESCRIPTION: Places a magenta line segment connecting (430, 12) to (288, 37).
; PLAN: r0=430(x1), r1=12(y1), r2=288(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 12
LDI r2, 288
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
