; DESCRIPTION: Creates a black rectangular region at (2, 81) spanning 21 by 97 pixels.
; PLAN: r0=2(x), r1=81(y), r2=21(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 81
LDI r2, 21
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
