; DESCRIPTION: Composite: . Then Places a yellow dot at position (166, 237). Then Draws a black circle centered at (86, 199) with radius 56.
; PLAN: r0=166(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=86(x), r1=199(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (166, 237).
; PLAN: r0=166(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (86, 199) with radius 56.
; PLAN: r0=86(x), r1=199(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 199
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
