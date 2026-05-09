; DESCRIPTION: Creates a yellow rectangular region at (88, 56) spanning 71 by 108 pixels.
; PLAN: r0=88(x), r1=56(y), r2=71(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 56
LDI r2, 71
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
