; DESCRIPTION: Composite: . Then Creates a red rectangular region at (158, 210) spanning 84 by 28 pixels. Then Sets a single purple pixel at (6, 129).
; PLAN: r0=158(x), r1=210(y), r2=84(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=6(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red rectangular region at (158, 210) spanning 84 by 28 pixels.
; PLAN: r0=158(x), r1=210(y), r2=84(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 210
LDI r2, 84
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (6, 129).
; PLAN: r0=6(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
