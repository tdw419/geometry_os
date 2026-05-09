; DESCRIPTION: Composite: . Then Places a green circle of radius 17 at center (62, 24). Then Renders a purple line between points (114, 90) and (29, 42).
; PLAN: r0=62(x), r1=24(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=114(x1), r1=90(y1), r2=29(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 17 at center (62, 24).
; PLAN: r0=62(x), r1=24(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 24
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (114, 90) and (29, 42).
; PLAN: r0=114(x1), r1=90(y1), r2=29(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 90
LDI r2, 29
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
