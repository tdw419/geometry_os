; DESCRIPTION: Renders a red line between points (52, 146) and (192, 255).
; PLAN: r0=52(x1), r1=146(y1), r2=192(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 146
LDI r2, 192
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
