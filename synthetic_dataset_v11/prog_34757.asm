; DESCRIPTION: Creates a yellow rectangular region at (38, 203) spanning 38 by 17 pixels.
; PLAN: r0=38(x), r1=203(y), r2=38(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 203
LDI r2, 38
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
