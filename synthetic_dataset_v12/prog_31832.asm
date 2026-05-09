; DESCRIPTION: Renders a yellow line between points (491, 86) and (251, 43).
; PLAN: r0=491(x1), r1=86(y1), r2=251(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 86
LDI r2, 251
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
