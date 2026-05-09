; DESCRIPTION: Composite: . Then Places a yellow circle of radius 35 at center (168, 59). Then Renders a blue line between points (19, 197) and (105, 227).
; PLAN: r0=168(x), r1=59(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x1), r1=197(y1), r2=105(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 35 at center (168, 59).
; PLAN: r0=168(x), r1=59(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 59
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (19, 197) and (105, 227).
; PLAN: r0=19(x1), r1=197(y1), r2=105(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 197
LDI r2, 105
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
