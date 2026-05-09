; DESCRIPTION: Composite: . Then Renders a yellow line between points (225, 18) and (15, 187). Then Places a blue circle of radius 43 at center (163, 171).
; PLAN: r0=225(x1), r1=18(y1), r2=15(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=171(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (225, 18) and (15, 187).
; PLAN: r0=225(x1), r1=18(y1), r2=15(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 18
LDI r2, 15
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 43 at center (163, 171).
; PLAN: r0=163(x), r1=171(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 171
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
