; DESCRIPTION: Creates a black rectangular region at (13, 57) spanning 96 by 85 pixels.
; PLAN: r0=13(x), r1=57(y), r2=96(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 57
LDI r2, 96
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
