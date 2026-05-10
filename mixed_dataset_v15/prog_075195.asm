; DESCRIPTION: Creates a white rectangular region at (88, 47) spanning 113 by 62 pixels.
; PLAN: r0=88(x), r1=47(y), r2=113(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 47
LDI r2, 113
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
