; DESCRIPTION: Creates a red rectangular region at (31, 114) spanning 62 by 71 pixels.
; PLAN: r0=31(x), r1=114(y), r2=62(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 114
LDI r2, 62
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
