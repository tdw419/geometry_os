; DESCRIPTION: Creates a black rectangular region at (302, 14) spanning 108 by 75 pixels.
; PLAN: r0=302(x), r1=14(y), r2=108(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 14
LDI r2, 108
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
