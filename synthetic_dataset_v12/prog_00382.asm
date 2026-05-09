; DESCRIPTION: Creates a black rectangular region at (471, 37) spanning 25 by 84 pixels.
; PLAN: r0=471(x), r1=37(y), r2=25(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 37
LDI r2, 25
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
