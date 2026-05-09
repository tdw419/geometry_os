; DESCRIPTION: Composite: . Then Sets a single blue pixel at (253, 56). Then Creates a green rectangular region at (7, 54) spanning 75 by 44 pixels.
; PLAN: r0=253(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=7(x), r1=54(y), r2=75(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (253, 56).
; PLAN: r0=253(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a green rectangular region at (7, 54) spanning 75 by 44 pixels.
; PLAN: r0=7(x), r1=54(y), r2=75(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 54
LDI r2, 75
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
