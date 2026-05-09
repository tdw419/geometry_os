; DESCRIPTION: Creates a black rectangular region at (288, 37) spanning 119 by 87 pixels.
; PLAN: r0=288(x), r1=37(y), r2=119(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 37
LDI r2, 119
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
