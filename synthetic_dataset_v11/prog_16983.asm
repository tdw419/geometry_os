; DESCRIPTION: Creates a white rectangular region at (122, 198) spanning 52 by 29 pixels.
; PLAN: r0=122(x), r1=198(y), r2=52(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 198
LDI r2, 52
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
