; DESCRIPTION: Creates a red rectangular region at (30, 57) spanning 35 by 78 pixels.
; PLAN: r0=30(x), r1=57(y), r2=35(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 57
LDI r2, 35
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
