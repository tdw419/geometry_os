; DESCRIPTION: Creates a black rectangular region at (188, 66) spanning 29 by 30 pixels.
; PLAN: r0=188(x), r1=66(y), r2=29(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 66
LDI r2, 29
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
