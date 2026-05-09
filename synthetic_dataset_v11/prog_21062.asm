; DESCRIPTION: Composite: . Then Renders a yellow box of size 90x18 starting at (15, 173). Then Sets a single blue pixel at (249, 40).
; PLAN: r0=15(x), r1=173(y), r2=90(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 90x18 starting at (15, 173).
; PLAN: r0=15(x), r1=173(y), r2=90(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 173
LDI r2, 90
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (249, 40).
; PLAN: r0=249(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 40
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
