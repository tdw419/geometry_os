; DESCRIPTION: Creates a red rectangular region at (238, 155) spanning 77 by 88 pixels.
; PLAN: r0=238(x), r1=155(y), r2=77(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 155
LDI r2, 77
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
