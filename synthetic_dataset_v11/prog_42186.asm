; DESCRIPTION: Creates a black rectangular region at (47, 161) spanning 17 by 33 pixels.
; PLAN: r0=47(x), r1=161(y), r2=17(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 161
LDI r2, 17
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
