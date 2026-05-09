; DESCRIPTION: Composite: . Then Draws a blue circle centered at (73, 105) with radius 28. Then Creates a orange rectangular region at (98, 75) spanning 21 by 63 pixels.
; PLAN: r0=73(x), r1=105(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=98(x), r1=75(y), r2=21(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (73, 105) with radius 28.
; PLAN: r0=73(x), r1=105(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 105
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (98, 75) spanning 21 by 63 pixels.
; PLAN: r0=98(x), r1=75(y), r2=21(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 75
LDI r2, 21
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
