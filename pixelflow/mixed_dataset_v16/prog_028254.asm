; DESCRIPTION: Creates a black rectangular region at (454, 133) spanning 33 by 17 pixels.
; PLAN: r0=454(x), r1=133(y), r2=33(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 133
LDI r2, 33
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
