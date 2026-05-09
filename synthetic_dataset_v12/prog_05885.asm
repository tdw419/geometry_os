; DESCRIPTION: Creates a black rectangular region at (163, 188) spanning 76 by 36 pixels.
; PLAN: r0=163(x), r1=188(y), r2=76(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 188
LDI r2, 76
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
