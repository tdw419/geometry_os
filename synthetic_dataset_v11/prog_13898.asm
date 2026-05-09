; DESCRIPTION: Composite: . Then Renders a magenta disk with center (135, 175) and radius 77. Then Creates a yellow rectangular region at (84, 78) spanning 101 by 54 pixels.
; PLAN: r0=135(x), r1=175(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=84(x), r1=78(y), r2=101(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (135, 175) and radius 77.
; PLAN: r0=135(x), r1=175(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 175
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a yellow rectangular region at (84, 78) spanning 101 by 54 pixels.
; PLAN: r0=84(x), r1=78(y), r2=101(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 78
LDI r2, 101
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
