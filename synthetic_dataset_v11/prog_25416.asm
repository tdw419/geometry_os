; DESCRIPTION: Composite: . Then Renders a black box of size 75x11 starting at (10, 188). Then Draws a blue circle centered at (185, 170) with radius 70.
; PLAN: r0=10(x), r1=188(y), r2=75(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=185(x), r1=170(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 75x11 starting at (10, 188).
; PLAN: r0=10(x), r1=188(y), r2=75(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 188
LDI r2, 75
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (185, 170) with radius 70.
; PLAN: r0=185(x), r1=170(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 170
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
