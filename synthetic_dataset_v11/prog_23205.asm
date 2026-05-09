; DESCRIPTION: Composite: . Then Places a magenta dot at position (234, 76). Then Creates a green circular shape at (67, 222) with radius 11.
; PLAN: r0=234(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=222(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta dot at position (234, 76).
; PLAN: r0=234(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (67, 222) with radius 11.
; PLAN: r0=67(x), r1=222(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 222
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
