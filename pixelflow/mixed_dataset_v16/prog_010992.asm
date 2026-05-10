; DESCRIPTION: Renders a red line between points (359, 255) and (213, 35).
; PLAN: r0=359(x1), r1=255(y1), r2=213(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 255
LDI r2, 213
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
