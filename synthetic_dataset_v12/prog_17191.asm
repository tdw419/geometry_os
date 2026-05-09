; DESCRIPTION: Creates a black rectangular region at (347, 157) spanning 55 by 72 pixels.
; PLAN: r0=347(x), r1=157(y), r2=55(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 157
LDI r2, 55
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
