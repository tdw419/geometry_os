; DESCRIPTION: Creates a yellow rectangular region at (97, 210) spanning 38 by 11 pixels.
; PLAN: r0=97(x), r1=210(y), r2=38(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 210
LDI r2, 38
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
