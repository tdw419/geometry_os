; DESCRIPTION: Composite: . Then Sets a single purple pixel at (96, 102). Then Renders a green box of size 64x89 starting at (173, 39).
; PLAN: r0=96(x), r1=102(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=173(x), r1=39(y), r2=64(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (96, 102).
; PLAN: r0=96(x), r1=102(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 102
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 64x89 starting at (173, 39).
; PLAN: r0=173(x), r1=39(y), r2=64(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 39
LDI r2, 64
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
