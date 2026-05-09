; DESCRIPTION: Composite: . Then Sets a single purple pixel at (112, 113). Then Creates a purple circular shape at (155, 149) with radius 69.
; PLAN: r0=112(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=149(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (112, 113).
; PLAN: r0=112(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (155, 149) with radius 69.
; PLAN: r0=155(x), r1=149(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 149
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
