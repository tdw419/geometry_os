; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (135, 121) with radius 80. Then Sets a single cyan pixel at (129, 102).
; PLAN: r0=135(x), r1=121(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (135, 121) with radius 80.
; PLAN: r0=135(x), r1=121(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 121
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (129, 102).
; PLAN: r0=129(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
