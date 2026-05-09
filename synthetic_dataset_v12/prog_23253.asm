; DESCRIPTION: Creates a yellow rectangular region at (353, 56) spanning 23 by 71 pixels.
; PLAN: r0=353(x), r1=56(y), r2=23(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 56
LDI r2, 23
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
