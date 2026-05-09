; DESCRIPTION: Creates a yellow rectangular region at (224, 26) spanning 53 by 96 pixels.
; PLAN: r0=224(x), r1=26(y), r2=53(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 26
LDI r2, 53
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
