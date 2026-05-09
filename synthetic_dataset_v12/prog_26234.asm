; DESCRIPTION: Creates a black rectangular region at (232, 144) spanning 28 by 71 pixels.
; PLAN: r0=232(x), r1=144(y), r2=28(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 144
LDI r2, 28
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
