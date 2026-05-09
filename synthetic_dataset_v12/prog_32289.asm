; DESCRIPTION: Creates a black rectangular region at (69, 89) spanning 76 by 90 pixels.
; PLAN: r0=69(x), r1=89(y), r2=76(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 89
LDI r2, 76
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
