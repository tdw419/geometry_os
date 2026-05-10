; DESCRIPTION: Creates a red rectangular region at (35, 78) spanning 114 by 24 pixels.
; PLAN: r0=35(x), r1=78(y), r2=114(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 78
LDI r2, 114
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
