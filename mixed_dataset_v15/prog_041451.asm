; DESCRIPTION: Creates a black rectangular region at (27, 105) spanning 76 by 19 pixels.
; PLAN: r0=27(x), r1=105(y), r2=76(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 105
LDI r2, 76
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
