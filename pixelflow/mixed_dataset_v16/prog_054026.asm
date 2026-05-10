; DESCRIPTION: Renders a purple line between points (175, 11) and (98, 55).
; PLAN: r0=175(x1), r1=11(y1), r2=98(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 11
LDI r2, 98
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
