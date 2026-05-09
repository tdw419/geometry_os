; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (215, 192). Then Creates a orange circular shape at (135, 72) with radius 10.
; PLAN: r0=215(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=72(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single magenta pixel at (215, 192).
; PLAN: r0=215(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (135, 72) with radius 10.
; PLAN: r0=135(x), r1=72(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 72
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
