; DESCRIPTION: Renders a black line between points (426, 130) and (269, 230).
; PLAN: r0=426(x1), r1=130(y1), r2=269(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 130
LDI r2, 269
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
