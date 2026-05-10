; DESCRIPTION: Creates a black rectangular region at (264, 84) spanning 99 by 82 pixels.
; PLAN: r0=264(x), r1=84(y), r2=99(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 84
LDI r2, 99
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
