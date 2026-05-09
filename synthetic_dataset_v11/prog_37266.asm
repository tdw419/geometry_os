; DESCRIPTION: Creates a yellow rectangular region at (29, 35) spanning 72 by 70 pixels.
; PLAN: r0=29(x), r1=35(y), r2=72(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 35
LDI r2, 72
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
