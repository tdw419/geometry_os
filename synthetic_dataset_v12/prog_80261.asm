; DESCRIPTION: Creates a white rectangular region at (53, 97) spanning 92 by 108 pixels.
; PLAN: r0=53(x), r1=97(y), r2=92(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 97
LDI r2, 92
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
