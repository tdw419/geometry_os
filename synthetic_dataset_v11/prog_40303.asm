; DESCRIPTION: Composite: . Then Sets a single black pixel at (26, 68). Then Draws a orange circle centered at (218, 199) with radius 28.
; PLAN: r0=26(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=218(x), r1=199(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (26, 68).
; PLAN: r0=26(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (218, 199) with radius 28.
; PLAN: r0=218(x), r1=199(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 199
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
