; DESCRIPTION: Composite: . Then Draws a white circle centered at (71, 21) with radius 17. Then Creates a blue rectangular region at (153, 195) spanning 52 by 55 pixels.
; PLAN: r0=71(x), r1=21(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x), r1=195(y), r2=52(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (71, 21) with radius 17.
; PLAN: r0=71(x), r1=21(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 21
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (153, 195) spanning 52 by 55 pixels.
; PLAN: r0=153(x), r1=195(y), r2=52(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 195
LDI r2, 52
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
