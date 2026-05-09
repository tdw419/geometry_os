; DESCRIPTION: Creates a white rectangular region at (58, 11) spanning 53 by 76 pixels.
; PLAN: r0=58(x), r1=11(y), r2=53(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 11
LDI r2, 53
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
