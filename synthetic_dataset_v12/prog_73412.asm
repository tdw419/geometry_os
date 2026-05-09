; DESCRIPTION: Creates a yellow rectangular region at (232, 70) spanning 43 by 48 pixels.
; PLAN: r0=232(x), r1=70(y), r2=43(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 70
LDI r2, 43
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
