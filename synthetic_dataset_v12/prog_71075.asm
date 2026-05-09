; DESCRIPTION: Creates a black rectangular region at (137, 13) spanning 39 by 60 pixels.
; PLAN: r0=137(x), r1=13(y), r2=39(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 13
LDI r2, 39
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
