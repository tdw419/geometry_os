; DESCRIPTION: Composite: . Then Renders a cyan disk with center (109, 184) and radius 53. Then Sets a single yellow pixel at (224, 116).
; PLAN: r0=109(x), r1=184(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=224(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan disk with center (109, 184) and radius 53.
; PLAN: r0=109(x), r1=184(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 184
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single yellow pixel at (224, 116).
; PLAN: r0=224(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
