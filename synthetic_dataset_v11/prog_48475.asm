; DESCRIPTION: Creates a black rectangular region at (81, 29) spanning 54 by 84 pixels.
; PLAN: r0=81(x), r1=29(y), r2=54(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 29
LDI r2, 54
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
