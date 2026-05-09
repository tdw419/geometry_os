; DESCRIPTION: Renders a orange line between points (308, 42) and (179, 16).
; PLAN: r0=308(x1), r1=42(y1), r2=179(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 42
LDI r2, 179
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
