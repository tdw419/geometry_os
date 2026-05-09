; DESCRIPTION: Composite: . Then Creates a black circular shape at (56, 90) with radius 45. Then Creates a magenta rectangular region at (62, 31) spanning 108 by 72 pixels.
; PLAN: r0=56(x), r1=90(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=62(x), r1=31(y), r2=108(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (56, 90) with radius 45.
; PLAN: r0=56(x), r1=90(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 90
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (62, 31) spanning 108 by 72 pixels.
; PLAN: r0=62(x), r1=31(y), r2=108(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 31
LDI r2, 108
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
