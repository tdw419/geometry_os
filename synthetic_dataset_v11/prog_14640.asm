; DESCRIPTION: Creates a black rectangular region at (136, 15) spanning 116 by 94 pixels.
; PLAN: r0=136(x), r1=15(y), r2=116(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 15
LDI r2, 116
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
