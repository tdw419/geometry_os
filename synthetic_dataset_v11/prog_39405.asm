; DESCRIPTION: Composite: . Then Renders a blue line between points (186, 63) and (81, 34). Then Places a yellow circle of radius 78 at center (124, 171).
; PLAN: r0=186(x1), r1=63(y1), r2=81(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=171(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue line between points (186, 63) and (81, 34).
; PLAN: r0=186(x1), r1=63(y1), r2=81(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 63
LDI r2, 81
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 78 at center (124, 171).
; PLAN: r0=124(x), r1=171(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 171
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
