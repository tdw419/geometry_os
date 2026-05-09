; DESCRIPTION: Composite: . Then Places a yellow dot at position (85, 205). Then Draws a magenta circle centered at (56, 209) with radius 33.
; PLAN: r0=85(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=209(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (85, 205).
; PLAN: r0=85(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 205
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta circle centered at (56, 209) with radius 33.
; PLAN: r0=56(x), r1=209(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 209
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
