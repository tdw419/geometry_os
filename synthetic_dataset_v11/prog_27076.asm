; DESCRIPTION: Creates a black rectangular region at (56, 163) spanning 21 by 54 pixels.
; PLAN: r0=56(x), r1=163(y), r2=21(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 163
LDI r2, 21
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
