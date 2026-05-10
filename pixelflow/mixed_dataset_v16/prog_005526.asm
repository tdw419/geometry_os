; DESCRIPTION: Places a magenta line segment connecting (360, 15) to (358, 123).
; PLAN: r0=360(x1), r1=15(y1), r2=358(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 15
LDI r2, 358
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
