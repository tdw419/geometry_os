; DESCRIPTION: Creates a black rectangular region at (112, 83) spanning 84 by 34 pixels.
; PLAN: r0=112(x), r1=83(y), r2=84(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 83
LDI r2, 84
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
