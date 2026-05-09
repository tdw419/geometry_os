; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (15, 36) spanning 77 by 109 pixels. Then Sets a single blue pixel at (0, 191).
; PLAN: r0=15(x), r1=36(y), r2=77(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=0(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow rectangular region at (15, 36) spanning 77 by 109 pixels.
; PLAN: r0=15(x), r1=36(y), r2=77(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 36
LDI r2, 77
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (0, 191).
; PLAN: r0=0(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
