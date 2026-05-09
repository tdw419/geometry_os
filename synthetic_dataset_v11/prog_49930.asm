; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (170, 98) with radius 57. Then Places a black dot at position (160, 222).
; PLAN: r0=170(x), r1=98(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (170, 98) with radius 57.
; PLAN: r0=170(x), r1=98(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 98
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (160, 222).
; PLAN: r0=160(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
HALT
