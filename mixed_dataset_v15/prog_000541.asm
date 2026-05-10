; DESCRIPTION: Creates a black rectangular region at (98, 15) spanning 54 by 105 pixels.
; PLAN: r0=98(x), r1=15(y), r2=54(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 15
LDI r2, 54
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
