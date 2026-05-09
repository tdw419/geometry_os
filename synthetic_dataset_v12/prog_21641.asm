; DESCRIPTION: Creates a black rectangular region at (188, 11) spanning 119 by 36 pixels.
; PLAN: r0=188(x), r1=11(y), r2=119(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 11
LDI r2, 119
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
