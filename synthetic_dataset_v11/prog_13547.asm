; DESCRIPTION: Creates a black rectangular region at (153, 89) spanning 24 by 76 pixels.
; PLAN: r0=153(x), r1=89(y), r2=24(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 89
LDI r2, 24
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
