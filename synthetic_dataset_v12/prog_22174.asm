; DESCRIPTION: Creates a black rectangular region at (21, 76) spanning 83 by 38 pixels.
; PLAN: r0=21(x), r1=76(y), r2=83(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 76
LDI r2, 83
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
