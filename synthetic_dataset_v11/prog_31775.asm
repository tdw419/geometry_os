; DESCRIPTION: Composite: . Then Places a green circle of radius 53 at center (97, 80). Then Places a blue dot at position (71, 144).
; PLAN: r0=97(x), r1=80(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=71(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 53 at center (97, 80).
; PLAN: r0=97(x), r1=80(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 80
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (71, 144).
; PLAN: r0=71(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
