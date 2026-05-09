; DESCRIPTION: Creates a white rectangular region at (118, 119) spanning 88 by 14 pixels.
; PLAN: r0=118(x), r1=119(y), r2=88(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 119
LDI r2, 88
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
