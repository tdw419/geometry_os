; DESCRIPTION: Places a purple line segment connecting (134, 38) to (196, 152).
; PLAN: r0=134(x1), r1=38(y1), r2=196(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 38
LDI r2, 196
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
