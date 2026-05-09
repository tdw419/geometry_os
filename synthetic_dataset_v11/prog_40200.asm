; DESCRIPTION: Creates a black rectangular region at (53, 32) spanning 55 by 33 pixels.
; PLAN: r0=53(x), r1=32(y), r2=55(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 32
LDI r2, 55
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
