; DESCRIPTION: Places a orange line segment connecting (87, 42) to (75, 34).
; PLAN: r0=87(x1), r1=42(y1), r2=75(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 42
LDI r2, 75
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
