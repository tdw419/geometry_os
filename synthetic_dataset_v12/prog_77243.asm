; DESCRIPTION: Places a orange line segment connecting (110, 6) to (264, 167).
; PLAN: r0=110(x1), r1=6(y1), r2=264(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 6
LDI r2, 264
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
