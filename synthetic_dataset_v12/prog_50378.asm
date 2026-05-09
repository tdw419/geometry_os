; DESCRIPTION: Creates a black rectangular region at (224, 123) spanning 101 by 12 pixels.
; PLAN: r0=224(x), r1=123(y), r2=101(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 123
LDI r2, 101
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
