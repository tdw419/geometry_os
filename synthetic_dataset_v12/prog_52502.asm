; DESCRIPTION: Creates a black rectangular region at (396, 54) spanning 11 by 21 pixels.
; PLAN: r0=396(x), r1=54(y), r2=11(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 54
LDI r2, 11
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
