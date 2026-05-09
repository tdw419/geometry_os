; DESCRIPTION: Renders a red line between points (195, 11) and (86, 175).
; PLAN: r0=195(x1), r1=11(y1), r2=86(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 11
LDI r2, 86
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
