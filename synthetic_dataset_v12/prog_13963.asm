; DESCRIPTION: Creates a black rectangular region at (427, 230) spanning 29 by 20 pixels.
; PLAN: r0=427(x), r1=230(y), r2=29(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 230
LDI r2, 29
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
