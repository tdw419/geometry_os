; DESCRIPTION: Renders a red line between points (244, 13) and (42, 4).
; PLAN: r0=244(x1), r1=13(y1), r2=42(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 13
LDI r2, 42
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
