; DESCRIPTION: Creates a yellow rectangular region at (252, 113) spanning 72 by 49 pixels.
; PLAN: r0=252(x), r1=113(y), r2=72(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 113
LDI r2, 72
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
