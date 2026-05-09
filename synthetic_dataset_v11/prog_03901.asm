; DESCRIPTION: Composite: . Then Places a yellow dot at position (97, 116). Then Renders a red disk with center (114, 83) and radius 78.
; PLAN: r0=97(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=114(x), r1=83(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (97, 116).
; PLAN: r0=97(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (114, 83) and radius 78.
; PLAN: r0=114(x), r1=83(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 83
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
