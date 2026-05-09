; DESCRIPTION: Composite: . Then Draws a red circle centered at (127, 84) with radius 56. Then Draws a yellow rectangle at (162, 86) with width 37 and height 55.
; PLAN: r0=127(x), r1=84(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=162(x), r1=86(y), r2=37(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (127, 84) with radius 56.
; PLAN: r0=127(x), r1=84(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 84
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (162, 86) with width 37 and height 55.
; PLAN: r0=162(x), r1=86(y), r2=37(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 86
LDI r2, 37
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
