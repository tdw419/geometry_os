; DESCRIPTION: Creates a black rectangular region at (385, 18) spanning 65 by 90 pixels.
; PLAN: r0=385(x), r1=18(y), r2=65(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 18
LDI r2, 65
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
