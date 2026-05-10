; DESCRIPTION: Creates a yellow rectangular region at (73, 114) spanning 106 by 53 pixels.
; PLAN: r0=73(x), r1=114(y), r2=106(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 114
LDI r2, 106
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
