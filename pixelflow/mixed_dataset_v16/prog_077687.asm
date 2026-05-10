; DESCRIPTION: Renders a red line between points (124, 42) and (55, 1).
; PLAN: r0=124(x1), r1=42(y1), r2=55(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 42
LDI r2, 55
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
