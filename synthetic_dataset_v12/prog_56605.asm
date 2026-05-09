; DESCRIPTION: Creates a yellow rectangular region at (268, 122) spanning 40 by 33 pixels.
; PLAN: r0=268(x), r1=122(y), r2=40(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 122
LDI r2, 40
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
