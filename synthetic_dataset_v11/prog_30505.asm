; DESCRIPTION: Composite: . Then Sets a single blue pixel at (210, 192). Then Creates a yellow rectangular region at (12, 20) spanning 50 by 103 pixels.
; PLAN: r0=210(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=12(x), r1=20(y), r2=50(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (210, 192).
; PLAN: r0=210(x), r1=192(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 192
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow rectangular region at (12, 20) spanning 50 by 103 pixels.
; PLAN: r0=12(x), r1=20(y), r2=50(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 20
LDI r2, 50
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
