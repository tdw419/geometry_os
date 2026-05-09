; DESCRIPTION: Creates a yellow rectangular region at (33, 142) spanning 14 by 25 pixels.
; PLAN: r0=33(x), r1=142(y), r2=14(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 142
LDI r2, 14
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
