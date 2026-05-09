; DESCRIPTION: Composite: . Then Places a magenta dot at position (119, 88). Then Renders a black disk with center (95, 176) and radius 53.
; PLAN: r0=119(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=95(x), r1=176(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (119, 88).
; PLAN: r0=119(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (95, 176) and radius 53.
; PLAN: r0=95(x), r1=176(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 176
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
