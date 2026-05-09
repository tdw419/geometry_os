; DESCRIPTION: Creates a black rectangular region at (133, 18) spanning 84 by 74 pixels.
; PLAN: r0=133(x), r1=18(y), r2=84(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 18
LDI r2, 84
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
