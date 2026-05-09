; DESCRIPTION: Composite: . Then Creates a blue circular shape at (81, 135) with radius 55. Then Sets a single magenta pixel at (128, 76).
; PLAN: r0=81(x), r1=135(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (81, 135) with radius 55.
; PLAN: r0=81(x), r1=135(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 135
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (128, 76).
; PLAN: r0=128(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
