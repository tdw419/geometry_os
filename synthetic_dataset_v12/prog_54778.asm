; DESCRIPTION: Creates a red rectangular region at (155, 164) spanning 31 by 78 pixels.
; PLAN: r0=155(x), r1=164(y), r2=31(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 164
LDI r2, 31
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
