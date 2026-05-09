; DESCRIPTION: Composite: . Then Creates a black rectangular region at (136, 27) spanning 93 by 112 pixels. Then Sets a single blue pixel at (56, 233).
; PLAN: r0=136(x), r1=27(y), r2=93(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=56(x), r1=233(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (136, 27) spanning 93 by 112 pixels.
; PLAN: r0=136(x), r1=27(y), r2=93(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 27
LDI r2, 93
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (56, 233).
; PLAN: r0=56(x), r1=233(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 233
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
