; DESCRIPTION: Creates a white rectangular region at (118, 198) spanning 60 by 21 pixels.
; PLAN: r0=118(x), r1=198(y), r2=60(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 198
LDI r2, 60
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
