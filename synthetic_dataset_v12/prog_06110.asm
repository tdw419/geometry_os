; DESCRIPTION: Creates a red rectangular region at (344, 88) spanning 17 by 72 pixels.
; PLAN: r0=344(x), r1=88(y), r2=17(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 88
LDI r2, 17
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
