; DESCRIPTION: Renders a black line between points (19, 111) and (226, 17).
; PLAN: r0=19(x1), r1=111(y1), r2=226(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 111
LDI r2, 226
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
