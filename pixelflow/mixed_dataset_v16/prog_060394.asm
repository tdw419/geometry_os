; DESCRIPTION: Creates a red rectangular region at (35, 19) spanning 78 by 114 pixels.
; PLAN: r0=35(x), r1=19(y), r2=78(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 19
LDI r2, 78
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
