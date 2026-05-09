; DESCRIPTION: Creates a white rectangular region at (47, 135) spanning 58 by 69 pixels.
; PLAN: r0=47(x), r1=135(y), r2=58(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 135
LDI r2, 58
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
