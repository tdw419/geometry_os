; DESCRIPTION: Creates a yellow rectangular region at (203, 113) spanning 84 by 40 pixels.
; PLAN: r0=203(x), r1=113(y), r2=84(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 113
LDI r2, 84
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
