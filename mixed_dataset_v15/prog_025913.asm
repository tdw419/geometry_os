; DESCRIPTION: Creates a white rectangular region at (62, 138) spanning 99 by 88 pixels.
; PLAN: r0=62(x), r1=138(y), r2=99(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 138
LDI r2, 99
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
