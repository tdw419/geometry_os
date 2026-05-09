; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (58, 6) spanning 11 by 116 pixels. Then Draws a magenta circle centered at (127, 175) with radius 80.
; PLAN: r0=58(x), r1=6(y), r2=11(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x), r1=175(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (58, 6) spanning 11 by 116 pixels.
; PLAN: r0=58(x), r1=6(y), r2=11(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 6
LDI r2, 11
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (127, 175) with radius 80.
; PLAN: r0=127(x), r1=175(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 175
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
