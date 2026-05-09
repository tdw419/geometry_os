; DESCRIPTION: Creates a black rectangular region at (476, 147) spanning 17 by 30 pixels.
; PLAN: r0=476(x), r1=147(y), r2=17(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 147
LDI r2, 17
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
