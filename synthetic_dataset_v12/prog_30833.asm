; DESCRIPTION: Creates a black rectangular region at (53, 207) spanning 114 by 47 pixels.
; PLAN: r0=53(x), r1=207(y), r2=114(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 207
LDI r2, 114
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
