; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (6, 137) spanning 89 by 107 pixels. Then Sets a single blue pixel at (241, 165).
; PLAN: r0=6(x), r1=137(y), r2=89(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=241(x), r1=165(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (6, 137) spanning 89 by 107 pixels.
; PLAN: r0=6(x), r1=137(y), r2=89(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 137
LDI r2, 89
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (241, 165).
; PLAN: r0=241(x), r1=165(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 165
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
