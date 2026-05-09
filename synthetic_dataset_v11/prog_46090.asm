; DESCRIPTION: Creates a black rectangular region at (207, 14) spanning 44 by 53 pixels.
; PLAN: r0=207(x), r1=14(y), r2=44(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 14
LDI r2, 44
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
