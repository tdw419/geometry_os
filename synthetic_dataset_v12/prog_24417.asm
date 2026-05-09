; DESCRIPTION: Creates a black rectangular region at (175, 76) spanning 37 by 106 pixels.
; PLAN: r0=175(x), r1=76(y), r2=37(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 76
LDI r2, 37
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
