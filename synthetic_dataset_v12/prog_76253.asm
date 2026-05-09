; DESCRIPTION: Creates a black rectangular region at (209, 78) spanning 53 by 114 pixels.
; PLAN: r0=209(x), r1=78(y), r2=53(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 78
LDI r2, 53
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
