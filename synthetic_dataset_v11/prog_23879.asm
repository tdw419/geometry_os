; DESCRIPTION: Composite: . Then Places a orange dot at position (30, 65). Then Creates a magenta circular shape at (218, 92) with radius 15.
; PLAN: r0=30(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=218(x), r1=92(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange dot at position (30, 65).
; PLAN: r0=30(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (218, 92) with radius 15.
; PLAN: r0=218(x), r1=92(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 92
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
