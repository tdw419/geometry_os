; DESCRIPTION: Composite: . Then Sets a single blue pixel at (77, 154). Then Creates a yellow rectangular region at (203, 77) spanning 32 by 90 pixels.
; PLAN: r0=77(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=203(x), r1=77(y), r2=32(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (77, 154).
; PLAN: r0=77(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (203, 77) spanning 32 by 90 pixels.
; PLAN: r0=203(x), r1=77(y), r2=32(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 77
LDI r2, 32
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
