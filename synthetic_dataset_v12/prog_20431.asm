; DESCRIPTION: Places a orange line segment connecting (432, 167) to (42, 142).
; PLAN: r0=432(x1), r1=167(y1), r2=42(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 167
LDI r2, 42
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
