; DESCRIPTION: Creates a yellow rectangular region at (6, 55) spanning 67 by 29 pixels.
; PLAN: r0=6(x), r1=55(y), r2=67(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 55
LDI r2, 67
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
