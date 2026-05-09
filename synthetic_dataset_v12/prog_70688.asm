; DESCRIPTION: Places a orange line segment connecting (424, 196) to (424, 73).
; PLAN: r0=424(x1), r1=196(y1), r2=424(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 196
LDI r2, 424
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
