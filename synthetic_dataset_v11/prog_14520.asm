; DESCRIPTION: Composite: . Then Renders a green disk with center (89, 156) and radius 34. Then Places a magenta dot at position (159, 183).
; PLAN: r0=89(x), r1=156(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=159(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (89, 156) and radius 34.
; PLAN: r0=89(x), r1=156(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 156
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (159, 183).
; PLAN: r0=159(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
