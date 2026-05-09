; DESCRIPTION: Composite: . Then Draws a purple rectangle at (115, 30) with width 23 and height 74. Then Draws a black circle centered at (145, 101) with radius 79.
; PLAN: r0=115(x), r1=30(y), r2=23(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x), r1=101(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (115, 30) with width 23 and height 74.
; PLAN: r0=115(x), r1=30(y), r2=23(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 30
LDI r2, 23
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (145, 101) with radius 79.
; PLAN: r0=145(x), r1=101(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 101
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
