; DESCRIPTION: Composite: . Then Creates a red rectangular region at (114, 92) spanning 13 by 29 pixels. Then Draws a red circle centered at (131, 84) with radius 66.
; PLAN: r0=114(x), r1=92(y), r2=13(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=131(x), r1=84(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (114, 92) spanning 13 by 29 pixels.
; PLAN: r0=114(x), r1=92(y), r2=13(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 92
LDI r2, 13
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (131, 84) with radius 66.
; PLAN: r0=131(x), r1=84(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 84
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
