; DESCRIPTION: Composite: . Then Sets a single purple pixel at (97, 78). Then Renders a yellow box of size 36x21 starting at (151, 3).
; PLAN: r0=97(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=151(x), r1=3(y), r2=36(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (97, 78).
; PLAN: r0=97(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 78
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 36x21 starting at (151, 3).
; PLAN: r0=151(x), r1=3(y), r2=36(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 3
LDI r2, 36
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
