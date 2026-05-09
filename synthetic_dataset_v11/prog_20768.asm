; DESCRIPTION: Places a orange line segment connecting (78, 64) to (186, 120).
; PLAN: r0=78(x1), r1=64(y1), r2=186(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 64
LDI r2, 186
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
