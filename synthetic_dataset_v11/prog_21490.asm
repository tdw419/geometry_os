; DESCRIPTION: Renders a red line between points (105, 140) and (0, 255).
; PLAN: r0=105(x1), r1=140(y1), r2=0(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 140
LDI r2, 0
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
