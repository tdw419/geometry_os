; DESCRIPTION: Composite: . Then Renders a blue line between points (90, 139) and (65, 127). Then Renders a yellow disk with center (194, 184) and radius 61.
; PLAN: r0=90(x1), r1=139(y1), r2=65(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=194(x), r1=184(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (90, 139) and (65, 127).
; PLAN: r0=90(x1), r1=139(y1), r2=65(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 139
LDI r2, 65
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (194, 184) and radius 61.
; PLAN: r0=194(x), r1=184(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 184
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
