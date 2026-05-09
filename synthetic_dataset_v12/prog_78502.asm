; DESCRIPTION: Creates a black rectangular region at (483, 188) spanning 26 by 30 pixels.
; PLAN: r0=483(x), r1=188(y), r2=26(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 188
LDI r2, 26
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
