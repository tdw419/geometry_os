; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (57, 254). Then Creates a cyan circular shape at (171, 88) with radius 70.
; PLAN: r0=57(x), r1=254(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=171(x), r1=88(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (57, 254).
; PLAN: r0=57(x), r1=254(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 57
LDI r1, 254
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a cyan circular shape at (171, 88) with radius 70.
; PLAN: r0=171(x), r1=88(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 88
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
