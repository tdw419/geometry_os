; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (10, 36) spanning 81 by 52 pixels. Then Sets a single purple pixel at (192, 85).
; PLAN: r0=10(x), r1=36(y), r2=81(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=192(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (10, 36) spanning 81 by 52 pixels.
; PLAN: r0=10(x), r1=36(y), r2=81(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 36
LDI r2, 81
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (192, 85).
; PLAN: r0=192(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
