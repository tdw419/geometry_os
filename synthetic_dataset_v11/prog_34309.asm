; DESCRIPTION: Composite: . Then Draws a orange circle centered at (218, 141) with radius 38. Then Draws a green rectangle at (116, 78) with width 105 and height 92.
; PLAN: r0=218(x), r1=141(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x), r1=78(y), r2=105(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (218, 141) with radius 38.
; PLAN: r0=218(x), r1=141(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 141
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (116, 78) with width 105 and height 92.
; PLAN: r0=116(x), r1=78(y), r2=105(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 78
LDI r2, 105
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
