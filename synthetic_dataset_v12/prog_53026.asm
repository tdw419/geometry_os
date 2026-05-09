; DESCRIPTION: Renders a red line between points (454, 7) and (66, 230).
; PLAN: r0=454(x1), r1=7(y1), r2=66(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 7
LDI r2, 66
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
