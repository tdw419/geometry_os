; DESCRIPTION: Creates a red rectangular region at (306, 32) spanning 35 by 102 pixels.
; PLAN: r0=306(x), r1=32(y), r2=35(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 32
LDI r2, 35
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
