; DESCRIPTION: Composite: . Then Sets a single red pixel at (101, 156). Then Draws a yellow rectangle at (49, 64) with width 21 and height 118.
; PLAN: r0=101(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=49(x), r1=64(y), r2=21(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (101, 156).
; PLAN: r0=101(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (49, 64) with width 21 and height 118.
; PLAN: r0=49(x), r1=64(y), r2=21(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 64
LDI r2, 21
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
