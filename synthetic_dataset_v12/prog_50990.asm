; DESCRIPTION: Creates a black rectangular region at (435, 154) spanning 13 by 43 pixels.
; PLAN: r0=435(x), r1=154(y), r2=13(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 154
LDI r2, 13
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
