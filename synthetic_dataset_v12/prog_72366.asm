; DESCRIPTION: Creates a black rectangular region at (314, 21) spanning 40 by 84 pixels.
; PLAN: r0=314(x), r1=21(y), r2=40(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 21
LDI r2, 40
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
