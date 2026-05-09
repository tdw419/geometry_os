; DESCRIPTION: Renders a red line between points (216, 105) and (175, 255).
; PLAN: r0=216(x1), r1=105(y1), r2=175(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 105
LDI r2, 175
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
