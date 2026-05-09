; DESCRIPTION: Composite: . Then Renders a purple box of size 27x114 starting at (85, 133). Then Sets a single blue pixel at (29, 191).
; PLAN: r0=85(x), r1=133(y), r2=27(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=29(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 27x114 starting at (85, 133).
; PLAN: r0=85(x), r1=133(y), r2=27(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 133
LDI r2, 27
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (29, 191).
; PLAN: r0=29(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
