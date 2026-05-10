; DESCRIPTION: Renders a purple line between points (425, 17) and (268, 12).
; PLAN: r0=425(x1), r1=17(y1), r2=268(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 17
LDI r2, 268
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
