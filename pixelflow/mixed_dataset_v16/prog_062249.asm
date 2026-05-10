; DESCRIPTION: Creates a black rectangular region at (390, 154) spanning 103 by 37 pixels.
; PLAN: r0=390(x), r1=154(y), r2=103(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 154
LDI r2, 103
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
