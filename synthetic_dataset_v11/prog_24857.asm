; DESCRIPTION: Renders a red line between points (72, 42) and (241, 9).
; PLAN: r0=72(x1), r1=42(y1), r2=241(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 42
LDI r2, 241
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
