; DESCRIPTION: Places a orange line segment connecting (42, 85) to (116, 19).
; PLAN: r0=42(x1), r1=85(y1), r2=116(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 85
LDI r2, 116
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
