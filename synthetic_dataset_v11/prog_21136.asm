; DESCRIPTION: Composite: . Then Creates a red circular shape at (144, 136) with radius 76. Then Sets a single cyan pixel at (14, 21).
; PLAN: r0=144(x), r1=136(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=14(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (144, 136) with radius 76.
; PLAN: r0=144(x), r1=136(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 136
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (14, 21).
; PLAN: r0=14(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
