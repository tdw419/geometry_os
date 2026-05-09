; DESCRIPTION: Composite: . Then Sets a single white pixel at (130, 109). Then Draws a red circle centered at (69, 195) with radius 61.
; PLAN: r0=130(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=195(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (130, 109).
; PLAN: r0=130(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (69, 195) with radius 61.
; PLAN: r0=69(x), r1=195(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 195
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
