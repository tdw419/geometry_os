; DESCRIPTION: Places a orange line segment connecting (42, 232) to (217, 157).
; PLAN: r0=42(x1), r1=232(y1), r2=217(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 232
LDI r2, 217
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
