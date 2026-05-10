; DESCRIPTION: Renders a yellow line between points (426, 243) and (35, 165).
; PLAN: r0=426(x1), r1=243(y1), r2=35(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 243
LDI r2, 35
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
