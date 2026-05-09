; DESCRIPTION: Creates a black rectangular region at (90, 105) spanning 19 by 87 pixels.
; PLAN: r0=90(x), r1=105(y), r2=19(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 105
LDI r2, 19
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
