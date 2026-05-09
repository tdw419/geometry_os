; DESCRIPTION: Composite: . Then Places a magenta circle of radius 37 at center (157, 164). Then Places a yellow line segment connecting (120, 52) to (141, 115).
; PLAN: r0=157(x), r1=164(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x1), r1=52(y1), r2=141(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 37 at center (157, 164).
; PLAN: r0=157(x), r1=164(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 164
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (120, 52) to (141, 115).
; PLAN: r0=120(x1), r1=52(y1), r2=141(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 52
LDI r2, 141
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
