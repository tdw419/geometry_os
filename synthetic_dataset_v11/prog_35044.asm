; DESCRIPTION: Composite: . Then Draws a orange circle centered at (143, 235) with radius 20. Then Draws a purple rectangle at (139, 38) with width 117 and height 64.
; PLAN: r0=143(x), r1=235(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x), r1=38(y), r2=117(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (143, 235) with radius 20.
; PLAN: r0=143(x), r1=235(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 235
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (139, 38) with width 117 and height 64.
; PLAN: r0=139(x), r1=38(y), r2=117(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 38
LDI r2, 117
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
