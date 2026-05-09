; DESCRIPTION: Composite: . Then Sets a single blue pixel at (190, 106). Then Draws a red rectangle at (21, 48) with width 110 and height 68.
; PLAN: r0=190(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=21(x), r1=48(y), r2=110(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (190, 106).
; PLAN: r0=190(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (21, 48) with width 110 and height 68.
; PLAN: r0=21(x), r1=48(y), r2=110(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 48
LDI r2, 110
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
