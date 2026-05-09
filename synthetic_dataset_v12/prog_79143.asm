; DESCRIPTION: Creates a yellow rectangular region at (204, 139) spanning 35 by 73 pixels.
; PLAN: r0=204(x), r1=139(y), r2=35(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 139
LDI r2, 35
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
