; DESCRIPTION: Composite: . Then Draws a purple rectangle at (115, 78) with width 100 and height 80. Then Draws a purple circle centered at (150, 85) with radius 38.
; PLAN: r0=115(x), r1=78(y), r2=100(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x), r1=85(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (115, 78) with width 100 and height 80.
; PLAN: r0=115(x), r1=78(y), r2=100(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 78
LDI r2, 100
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (150, 85) with radius 38.
; PLAN: r0=150(x), r1=85(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 85
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
