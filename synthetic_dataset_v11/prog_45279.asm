; DESCRIPTION: Composite: . Then Places a magenta dot at position (101, 245). Then Creates a green circular shape at (172, 181) with radius 69.
; PLAN: r0=101(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=172(x), r1=181(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (101, 245).
; PLAN: r0=101(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (172, 181) with radius 69.
; PLAN: r0=172(x), r1=181(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 181
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
