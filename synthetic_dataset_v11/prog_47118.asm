; DESCRIPTION: Composite: . Then Places a black circle of radius 54 at center (147, 129). Then Places a blue dot at position (144, 193).
; PLAN: r0=147(x), r1=129(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 54 at center (147, 129).
; PLAN: r0=147(x), r1=129(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 129
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (144, 193).
; PLAN: r0=144(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
