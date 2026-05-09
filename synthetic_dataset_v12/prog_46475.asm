; DESCRIPTION: Renders a red line between points (324, 42) and (68, 77).
; PLAN: r0=324(x1), r1=42(y1), r2=68(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 42
LDI r2, 68
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
