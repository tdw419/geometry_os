; DESCRIPTION: Creates a yellow rectangular region at (69, 21) spanning 88 by 108 pixels.
; PLAN: r0=69(x), r1=21(y), r2=88(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 21
LDI r2, 88
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
