; DESCRIPTION: Renders a red line between points (396, 0) and (79, 240).
; PLAN: r0=396(x1), r1=0(y1), r2=79(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 0
LDI r2, 79
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
