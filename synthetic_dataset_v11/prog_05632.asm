; DESCRIPTION: Composite: . Then Draws a green circle centered at (219, 55) with radius 36. Then Creates a blue rectangular region at (18, 10) spanning 107 by 120 pixels.
; PLAN: r0=219(x), r1=55(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x), r1=10(y), r2=107(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (219, 55) with radius 36.
; PLAN: r0=219(x), r1=55(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 55
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (18, 10) spanning 107 by 120 pixels.
; PLAN: r0=18(x), r1=10(y), r2=107(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 10
LDI r2, 107
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
