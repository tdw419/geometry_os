; DESCRIPTION: Creates a black rectangular region at (238, 29) spanning 43 by 69 pixels.
; PLAN: r0=238(x), r1=29(y), r2=43(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 29
LDI r2, 43
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
