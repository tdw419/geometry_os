; DESCRIPTION: Places a orange line segment connecting (444, 54) to (486, 128).
; PLAN: r0=444(x1), r1=54(y1), r2=486(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 54
LDI r2, 486
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
