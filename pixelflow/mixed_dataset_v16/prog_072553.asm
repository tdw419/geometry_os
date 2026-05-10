; DESCRIPTION: Creates a yellow rectangular region at (34, 140) spanning 60 by 116 pixels.
; PLAN: r0=34(x), r1=140(y), r2=60(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 140
LDI r2, 60
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
