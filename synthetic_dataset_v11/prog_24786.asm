; DESCRIPTION: Renders a red line between points (185, 115) and (228, 255).
; PLAN: r0=185(x1), r1=115(y1), r2=228(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 115
LDI r2, 228
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
