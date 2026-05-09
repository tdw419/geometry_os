; DESCRIPTION: Creates a black rectangular region at (24, 84) spanning 80 by 78 pixels.
; PLAN: r0=24(x), r1=84(y), r2=80(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 84
LDI r2, 80
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
