; DESCRIPTION: Places a orange line segment connecting (42, 55) to (73, 185).
; PLAN: r0=42(x1), r1=55(y1), r2=73(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 55
LDI r2, 73
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
