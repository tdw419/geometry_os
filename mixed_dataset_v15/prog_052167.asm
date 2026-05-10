; DESCRIPTION: Creates a black rectangular region at (268, 68) spanning 119 by 74 pixels.
; PLAN: r0=268(x), r1=68(y), r2=119(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 68
LDI r2, 119
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
