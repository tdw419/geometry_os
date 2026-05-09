; DESCRIPTION: Creates a black rectangular region at (422, 43) spanning 17 by 119 pixels.
; PLAN: r0=422(x), r1=43(y), r2=17(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 43
LDI r2, 17
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
