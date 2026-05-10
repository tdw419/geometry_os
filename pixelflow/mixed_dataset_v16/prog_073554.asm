; DESCRIPTION: Creates a red rectangular region at (177, 35) spanning 62 by 53 pixels.
; PLAN: r0=177(x), r1=35(y), r2=62(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 35
LDI r2, 62
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
