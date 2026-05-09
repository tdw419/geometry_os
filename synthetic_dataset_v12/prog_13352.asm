; DESCRIPTION: Creates a black rectangular region at (334, 75) spanning 30 by 14 pixels.
; PLAN: r0=334(x), r1=75(y), r2=30(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 75
LDI r2, 30
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
