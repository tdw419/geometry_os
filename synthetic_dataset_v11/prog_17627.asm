; DESCRIPTION: Places a orange line segment connecting (253, 94) to (90, 96).
; PLAN: r0=253(x1), r1=94(y1), r2=90(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 94
LDI r2, 90
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
