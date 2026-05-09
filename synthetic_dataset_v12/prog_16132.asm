; DESCRIPTION: Creates a white rectangular region at (455, 69) spanning 53 by 43 pixels.
; PLAN: r0=455(x), r1=69(y), r2=53(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 69
LDI r2, 53
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
