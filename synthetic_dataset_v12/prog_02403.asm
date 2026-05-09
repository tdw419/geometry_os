; DESCRIPTION: Creates a black rectangular region at (336, 157) spanning 29 by 13 pixels.
; PLAN: r0=336(x), r1=157(y), r2=29(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 157
LDI r2, 29
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
