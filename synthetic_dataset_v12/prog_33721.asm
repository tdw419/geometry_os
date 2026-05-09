; DESCRIPTION: Creates a black rectangular region at (101, 13) spanning 107 by 65 pixels.
; PLAN: r0=101(x), r1=13(y), r2=107(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 13
LDI r2, 107
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
