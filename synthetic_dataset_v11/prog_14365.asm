; DESCRIPTION: Creates a black rectangular region at (88, 90) spanning 65 by 65 pixels.
; PLAN: r0=88(x), r1=90(y), r2=65(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 90
LDI r2, 65
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
