; DESCRIPTION: Creates a black rectangular region at (56, 148) spanning 105 by 20 pixels.
; PLAN: r0=56(x), r1=148(y), r2=105(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 148
LDI r2, 105
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
