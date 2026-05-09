; DESCRIPTION: Creates a yellow rectangular region at (11, 73) spanning 22 by 56 pixels.
; PLAN: r0=11(x), r1=73(y), r2=22(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 73
LDI r2, 22
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
