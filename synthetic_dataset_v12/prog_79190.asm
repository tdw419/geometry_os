; DESCRIPTION: Creates a red rectangular region at (108, 114) spanning 105 by 106 pixels.
; PLAN: r0=108(x), r1=114(y), r2=105(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 114
LDI r2, 105
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
