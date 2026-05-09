; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (17, 135) spanning 74 by 47 pixels. Then Draws a yellow circle centered at (124, 148) with radius 62.
; PLAN: r0=17(x), r1=135(y), r2=74(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=124(x), r1=148(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a blue rectangular region at (17, 135) spanning 74 by 47 pixels.
; PLAN: r0=17(x), r1=135(y), r2=74(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 135
LDI r2, 74
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (124, 148) with radius 62.
; PLAN: r0=124(x), r1=148(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 148
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
