; DESCRIPTION: Composite: . Then Sets a single red pixel at (214, 108). Then Creates a magenta circular shape at (58, 105) with radius 55.
; PLAN: r0=214(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=58(x), r1=105(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (214, 108).
; PLAN: r0=214(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (58, 105) with radius 55.
; PLAN: r0=58(x), r1=105(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 105
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
