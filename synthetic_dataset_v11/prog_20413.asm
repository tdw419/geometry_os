; DESCRIPTION: Creates a yellow rectangular region at (105, 11) spanning 13 by 29 pixels.
; PLAN: r0=105(x), r1=11(y), r2=13(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 11
LDI r2, 13
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
