; DESCRIPTION: Creates a yellow rectangular region at (435, 139) spanning 22 by 114 pixels.
; PLAN: r0=435(x), r1=139(y), r2=22(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 139
LDI r2, 22
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
