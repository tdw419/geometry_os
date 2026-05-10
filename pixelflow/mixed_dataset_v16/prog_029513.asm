; DESCRIPTION: Creates a white rectangular region at (311, 7) spanning 88 by 108 pixels.
; PLAN: r0=311(x), r1=7(y), r2=88(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 7
LDI r2, 88
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
