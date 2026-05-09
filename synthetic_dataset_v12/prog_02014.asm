; DESCRIPTION: Creates a red rectangular region at (420, 72) spanning 88 by 97 pixels.
; PLAN: r0=420(x), r1=72(y), r2=88(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 72
LDI r2, 88
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
