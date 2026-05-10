; DESCRIPTION: Renders a purple line between points (17, 197) and (12, 105).
; PLAN: r0=17(x1), r1=197(y1), r2=12(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 197
LDI r2, 12
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
