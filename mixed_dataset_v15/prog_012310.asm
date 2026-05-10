; DESCRIPTION: Creates a red rectangular region at (359, 66) spanning 34 by 102 pixels.
; PLAN: r0=359(x), r1=66(y), r2=34(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 66
LDI r2, 34
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
