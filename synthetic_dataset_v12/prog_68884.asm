; DESCRIPTION: Renders a red line between points (259, 85) and (3, 42).
; PLAN: r0=259(x1), r1=85(y1), r2=3(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 85
LDI r2, 3
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
