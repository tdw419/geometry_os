; DESCRIPTION: Creates a black rectangular region at (31, 69) spanning 62 by 113 pixels.
; PLAN: r0=31(x), r1=69(y), r2=62(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 69
LDI r2, 62
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
