; DESCRIPTION: Creates a black rectangular region at (62, 72) spanning 115 by 75 pixels.
; PLAN: r0=62(x), r1=72(y), r2=115(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 72
LDI r2, 115
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
