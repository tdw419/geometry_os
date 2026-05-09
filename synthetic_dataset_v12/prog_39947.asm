; DESCRIPTION: Renders a red line between points (448, 80) and (42, 83).
; PLAN: r0=448(x1), r1=80(y1), r2=42(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 80
LDI r2, 42
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
