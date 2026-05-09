; DESCRIPTION: Creates a yellow rectangular region at (133, 22) spanning 105 by 39 pixels.
; PLAN: r0=133(x), r1=22(y), r2=105(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 22
LDI r2, 105
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
