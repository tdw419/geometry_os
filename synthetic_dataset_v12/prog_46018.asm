; DESCRIPTION: Creates a black rectangular region at (453, 31) spanning 37 by 39 pixels.
; PLAN: r0=453(x), r1=31(y), r2=37(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 31
LDI r2, 37
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
