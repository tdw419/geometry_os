; DESCRIPTION: Creates a black rectangular region at (376, 157) spanning 13 by 49 pixels.
; PLAN: r0=376(x), r1=157(y), r2=13(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 157
LDI r2, 13
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
