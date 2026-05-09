; DESCRIPTION: Composite: . Then Places a magenta circle of radius 34 at center (151, 177). Then Renders a yellow line between points (241, 193) and (170, 220).
; PLAN: r0=151(x), r1=177(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x1), r1=193(y1), r2=170(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 34 at center (151, 177).
; PLAN: r0=151(x), r1=177(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 177
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (241, 193) and (170, 220).
; PLAN: r0=241(x1), r1=193(y1), r2=170(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 193
LDI r2, 170
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
