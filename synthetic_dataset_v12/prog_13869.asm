; DESCRIPTION: Creates a red rectangular region at (227, 106) spanning 96 by 47 pixels.
; PLAN: r0=227(x), r1=106(y), r2=96(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 106
LDI r2, 96
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
