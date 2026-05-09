; DESCRIPTION: Creates a black rectangular region at (256, 66) spanning 101 by 98 pixels.
; PLAN: r0=256(x), r1=66(y), r2=101(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 66
LDI r2, 101
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
