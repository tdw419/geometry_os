; DESCRIPTION: Creates a yellow rectangular region at (28, 157) spanning 34 by 49 pixels.
; PLAN: r0=28(x), r1=157(y), r2=34(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 157
LDI r2, 34
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
