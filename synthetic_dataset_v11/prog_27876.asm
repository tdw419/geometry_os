; DESCRIPTION: Composite: . Then Creates a black rectangular region at (78, 6) spanning 89 by 104 pixels. Then Sets a single yellow pixel at (156, 71).
; PLAN: r0=78(x), r1=6(y), r2=89(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=156(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (78, 6) spanning 89 by 104 pixels.
; PLAN: r0=78(x), r1=6(y), r2=89(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 6
LDI r2, 89
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (156, 71).
; PLAN: r0=156(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 71
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
