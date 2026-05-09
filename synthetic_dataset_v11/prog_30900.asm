; DESCRIPTION: Composite: . Then Renders a blue box of size 89x71 starting at (163, 37). Then Sets a single cyan pixel at (132, 163).
; PLAN: r0=163(x), r1=37(y), r2=89(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 89x71 starting at (163, 37).
; PLAN: r0=163(x), r1=37(y), r2=89(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 37
LDI r2, 89
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (132, 163).
; PLAN: r0=132(x), r1=163(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 163
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
