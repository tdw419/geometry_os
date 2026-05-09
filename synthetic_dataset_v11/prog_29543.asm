; DESCRIPTION: Creates a red rectangular region at (67, 84) spanning 72 by 88 pixels.
; PLAN: r0=67(x), r1=84(y), r2=72(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 84
LDI r2, 72
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
