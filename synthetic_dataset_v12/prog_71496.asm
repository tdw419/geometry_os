; DESCRIPTION: Creates a white rectangular region at (414, 101) spanning 49 by 108 pixels.
; PLAN: r0=414(x), r1=101(y), r2=49(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 101
LDI r2, 49
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
