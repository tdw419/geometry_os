; DESCRIPTION: Composite: . Then Places a orange dot at position (55, 71). Then Draws a yellow circle centered at (156, 183) with radius 46.
; PLAN: r0=55(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=156(x), r1=183(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (55, 71).
; PLAN: r0=55(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (156, 183) with radius 46.
; PLAN: r0=156(x), r1=183(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 183
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
