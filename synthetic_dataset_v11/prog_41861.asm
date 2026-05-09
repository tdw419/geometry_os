; DESCRIPTION: Creates a black rectangular region at (49, 5) spanning 107 by 15 pixels.
; PLAN: r0=49(x), r1=5(y), r2=107(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 5
LDI r2, 107
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
