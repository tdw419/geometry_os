; DESCRIPTION: Composite: . Then Sets a single blue pixel at (237, 240). Then Renders a black box of size 80x20 starting at (21, 100).
; PLAN: r0=237(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=21(x), r1=100(y), r2=80(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (237, 240).
; PLAN: r0=237(x), r1=240(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 240
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 80x20 starting at (21, 100).
; PLAN: r0=21(x), r1=100(y), r2=80(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 100
LDI r2, 80
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
