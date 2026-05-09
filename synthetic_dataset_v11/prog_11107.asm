; DESCRIPTION: Composite: . Then Places a yellow circle of radius 48 at center (114, 159). Then Places a yellow line segment connecting (144, 254) to (70, 144).
; PLAN: r0=114(x), r1=159(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x1), r1=254(y1), r2=70(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 48 at center (114, 159).
; PLAN: r0=114(x), r1=159(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 159
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (144, 254) to (70, 144).
; PLAN: r0=144(x1), r1=254(y1), r2=70(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 254
LDI r2, 70
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
