; DESCRIPTION: Places a red line segment connecting (66, 193) to (85, 42).
; PLAN: r0=66(x1), r1=193(y1), r2=85(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 193
LDI r2, 85
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
