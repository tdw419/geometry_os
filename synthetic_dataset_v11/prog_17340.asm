; DESCRIPTION: Creates a red rectangular region at (9, 78) spanning 28 by 29 pixels.
; PLAN: r0=9(x), r1=78(y), r2=28(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 78
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
