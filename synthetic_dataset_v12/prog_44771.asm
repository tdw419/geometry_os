; DESCRIPTION: Places a blue line segment connecting (117, 9) to (151, 56).
; PLAN: r0=117(x1), r1=9(y1), r2=151(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 9
LDI r2, 151
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
