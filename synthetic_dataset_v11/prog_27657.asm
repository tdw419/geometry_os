; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (149, 183) spanning 59 by 50 pixels. Then Creates a black circular shape at (203, 98) with radius 24.
; PLAN: r0=149(x), r1=183(y), r2=59(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x), r1=98(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (149, 183) spanning 59 by 50 pixels.
; PLAN: r0=149(x), r1=183(y), r2=59(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 183
LDI r2, 59
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (203, 98) with radius 24.
; PLAN: r0=203(x), r1=98(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 98
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
