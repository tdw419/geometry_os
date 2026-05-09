; DESCRIPTION: Creates a black rectangular region at (336, 20) spanning 62 by 103 pixels.
; PLAN: r0=336(x), r1=20(y), r2=62(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 20
LDI r2, 62
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
