; DESCRIPTION: Composite: Creates a green rectangular region at (96, 41) spanning 112 by 43 pixels then Draws a orange circle centered at (403, 122) with radius 77.
; PLAN: r0=96(x), r1=41(y), r2=112(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x), r6=122(y), r7=77(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 41
LDI r2, 112
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 122
LDI r7, 77
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
