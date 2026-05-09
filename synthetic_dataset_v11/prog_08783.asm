; DESCRIPTION: Composite: . Then Renders a black box of size 11x108 starting at (23, 59). Then Creates a black circular shape at (88, 133) with radius 63.
; PLAN: r0=23(x), r1=59(y), r2=11(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=88(x), r1=133(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 11x108 starting at (23, 59).
; PLAN: r0=23(x), r1=59(y), r2=11(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 59
LDI r2, 11
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (88, 133) with radius 63.
; PLAN: r0=88(x), r1=133(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 133
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
