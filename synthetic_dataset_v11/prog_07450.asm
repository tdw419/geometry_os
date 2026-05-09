; DESCRIPTION: Composite: . Then Draws a green circle centered at (171, 155) with radius 53. Then Creates a orange rectangular region at (134, 203) spanning 17 by 53 pixels.
; PLAN: r0=171(x), r1=155(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=203(y), r2=17(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (171, 155) with radius 53.
; PLAN: r0=171(x), r1=155(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 155
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (134, 203) spanning 17 by 53 pixels.
; PLAN: r0=134(x), r1=203(y), r2=17(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 203
LDI r2, 17
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
