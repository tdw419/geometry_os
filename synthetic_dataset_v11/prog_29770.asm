; DESCRIPTION: Composite: . Then Creates a orange circular shape at (69, 78) with radius 25. Then Sets a single magenta pixel at (143, 15).
; PLAN: r0=69(x), r1=78(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=143(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (69, 78) with radius 25.
; PLAN: r0=69(x), r1=78(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 78
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (143, 15).
; PLAN: r0=143(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
