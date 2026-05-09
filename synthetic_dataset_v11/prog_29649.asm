; DESCRIPTION: Composite: . Then Draws a orange circle centered at (44, 116) with radius 10. Then Creates a magenta rectangular region at (76, 48) spanning 108 by 68 pixels.
; PLAN: r0=44(x), r1=116(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=76(x), r1=48(y), r2=108(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (44, 116) with radius 10.
; PLAN: r0=44(x), r1=116(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 116
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (76, 48) spanning 108 by 68 pixels.
; PLAN: r0=76(x), r1=48(y), r2=108(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 48
LDI r2, 108
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
