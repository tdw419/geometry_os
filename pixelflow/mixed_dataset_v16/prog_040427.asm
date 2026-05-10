; DESCRIPTION: Creates a yellow rectangular region at (383, 73) spanning 34 by 114 pixels.
; PLAN: r0=383(x), r1=73(y), r2=34(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 73
LDI r2, 34
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
