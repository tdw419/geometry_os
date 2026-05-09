; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (174, 62). Then Creates a magenta circular shape at (92, 141) with radius 56.
; PLAN: r0=174(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=141(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (174, 62).
; PLAN: r0=174(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (92, 141) with radius 56.
; PLAN: r0=92(x), r1=141(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 141
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
