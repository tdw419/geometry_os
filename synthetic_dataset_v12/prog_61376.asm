; DESCRIPTION: Renders a purple line between points (464, 43) and (17, 202).
; PLAN: r0=464(x1), r1=43(y1), r2=17(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 43
LDI r2, 17
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
