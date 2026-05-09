; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (174, 49) with width 21 and height 110. Then Draws a green circle centered at (101, 191) with radius 65.
; PLAN: r0=174(x), r1=49(y), r2=21(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=101(x), r1=191(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (174, 49) with width 21 and height 110.
; PLAN: r0=174(x), r1=49(y), r2=21(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 49
LDI r2, 21
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (101, 191) with radius 65.
; PLAN: r0=101(x), r1=191(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 191
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
