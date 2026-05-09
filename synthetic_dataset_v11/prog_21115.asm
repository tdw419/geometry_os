; DESCRIPTION: Creates a black rectangular region at (110, 114) spanning 11 by 94 pixels.
; PLAN: r0=110(x), r1=114(y), r2=11(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 114
LDI r2, 11
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
