; DESCRIPTION: Composite: . Then Renders a purple line between points (255, 121) and (58, 187). Then Renders a black disk with center (170, 181) and radius 37.
; PLAN: r0=255(x1), r1=121(y1), r2=58(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=181(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (255, 121) and (58, 187).
; PLAN: r0=255(x1), r1=121(y1), r2=58(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 121
LDI r2, 58
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (170, 181) and radius 37.
; PLAN: r0=170(x), r1=181(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 181
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
