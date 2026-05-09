; DESCRIPTION: Places a orange line segment connecting (102, 250) to (253, 42).
; PLAN: r0=102(x1), r1=250(y1), r2=253(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 250
LDI r2, 253
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
