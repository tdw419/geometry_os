; DESCRIPTION: Creates a yellow rectangular region at (135, 124) spanning 114 by 62 pixels.
; PLAN: r0=135(x), r1=124(y), r2=114(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 124
LDI r2, 114
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
