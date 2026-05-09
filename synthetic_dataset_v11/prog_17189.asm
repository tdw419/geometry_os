; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (181, 83) with radius 46. Then Places a black dot at position (225, 93).
; PLAN: r0=181(x), r1=83(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=225(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (181, 83) with radius 46.
; PLAN: r0=181(x), r1=83(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 83
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (225, 93).
; PLAN: r0=225(x), r1=93(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 93
LDI r2, 0x000000
PSET r0, r1, r2
HALT
