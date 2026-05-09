; DESCRIPTION: Creates a red rectangular region at (194, 49) spanning 35 by 108 pixels.
; PLAN: r0=194(x), r1=49(y), r2=35(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 49
LDI r2, 35
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
