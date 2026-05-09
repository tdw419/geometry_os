; DESCRIPTION: Composite: . Then Draws a blue circle centered at (83, 29) with radius 24. Then Creates a white rectangular region at (102, 80) spanning 119 by 113 pixels.
; PLAN: r0=83(x), r1=29(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=102(x), r1=80(y), r2=119(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (83, 29) with radius 24.
; PLAN: r0=83(x), r1=29(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 29
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (102, 80) spanning 119 by 113 pixels.
; PLAN: r0=102(x), r1=80(y), r2=119(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 80
LDI r2, 119
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
