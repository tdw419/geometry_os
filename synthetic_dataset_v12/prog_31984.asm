; DESCRIPTION: Places a orange line segment connecting (184, 38) to (96, 118).
; PLAN: r0=184(x1), r1=38(y1), r2=96(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 38
LDI r2, 96
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
