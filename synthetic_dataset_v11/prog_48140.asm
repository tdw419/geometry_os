; DESCRIPTION: Composite: . Then Draws a purple circle centered at (102, 150) with radius 35. Then Draws a red rectangle at (144, 5) with width 37 and height 105.
; PLAN: r0=102(x), r1=150(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=144(x), r1=5(y), r2=37(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (102, 150) with radius 35.
; PLAN: r0=102(x), r1=150(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 150
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (144, 5) with width 37 and height 105.
; PLAN: r0=144(x), r1=5(y), r2=37(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 5
LDI r2, 37
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
