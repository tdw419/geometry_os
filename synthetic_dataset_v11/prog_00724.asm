; DESCRIPTION: Creates a black rectangular region at (136, 1) spanning 23 by 86 pixels.
; PLAN: r0=136(x), r1=1(y), r2=23(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 1
LDI r2, 23
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
