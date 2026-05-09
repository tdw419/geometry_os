; DESCRIPTION: Composite: . Then Draws a black rectangle at (89, 30) with width 103 and height 73. Then Sets a single blue pixel at (120, 42).
; PLAN: r0=89(x), r1=30(y), r2=103(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (89, 30) with width 103 and height 73.
; PLAN: r0=89(x), r1=30(y), r2=103(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 30
LDI r2, 103
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (120, 42).
; PLAN: r0=120(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
