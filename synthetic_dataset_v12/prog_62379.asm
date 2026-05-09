; DESCRIPTION: Places a orange line segment connecting (237, 96) to (4, 69).
; PLAN: r0=237(x1), r1=96(y1), r2=4(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 96
LDI r2, 4
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
