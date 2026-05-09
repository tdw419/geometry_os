; DESCRIPTION: Creates a black rectangular region at (222, 78) spanning 29 by 86 pixels.
; PLAN: r0=222(x), r1=78(y), r2=29(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 78
LDI r2, 29
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
