; DESCRIPTION: Renders a green line between points (315, 251) and (270, 165).
; PLAN: r0=315(x1), r1=251(y1), r2=270(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 251
LDI r2, 270
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
