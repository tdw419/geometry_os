; DESCRIPTION: Composite: . Then Places a green circle of radius 68 at center (88, 184). Then Places a magenta dot at position (194, 181).
; PLAN: r0=88(x), r1=184(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=194(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 68 at center (88, 184).
; PLAN: r0=88(x), r1=184(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 184
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (194, 181).
; PLAN: r0=194(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
