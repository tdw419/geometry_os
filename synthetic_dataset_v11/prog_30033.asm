; DESCRIPTION: Places a orange line segment connecting (32, 183) to (147, 57).
; PLAN: r0=32(x1), r1=183(y1), r2=147(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 183
LDI r2, 147
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
