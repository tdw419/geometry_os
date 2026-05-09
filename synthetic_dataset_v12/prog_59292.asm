; DESCRIPTION: Creates a red rectangular region at (457, 138) spanning 53 by 98 pixels.
; PLAN: r0=457(x), r1=138(y), r2=53(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 138
LDI r2, 53
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
