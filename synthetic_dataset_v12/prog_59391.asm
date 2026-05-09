; DESCRIPTION: Places a magenta line segment connecting (381, 214) to (435, 20).
; PLAN: r0=381(x1), r1=214(y1), r2=435(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 214
LDI r2, 435
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
