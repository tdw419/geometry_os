; DESCRIPTION: Composite: . Then Renders a blue box of size 89x35 starting at (167, 3). Then Sets a single cyan pixel at (222, 202).
; PLAN: r0=167(x), r1=3(y), r2=89(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=222(x), r1=202(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue box of size 89x35 starting at (167, 3).
; PLAN: r0=167(x), r1=3(y), r2=89(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 3
LDI r2, 89
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (222, 202).
; PLAN: r0=222(x), r1=202(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 202
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
