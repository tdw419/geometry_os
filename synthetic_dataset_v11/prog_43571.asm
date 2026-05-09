; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (218, 22). Then Creates a red circular shape at (157, 189) with radius 41.
; PLAN: r0=218(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=157(x), r1=189(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (218, 22).
; PLAN: r0=218(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (157, 189) with radius 41.
; PLAN: r0=157(x), r1=189(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 189
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
