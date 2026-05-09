; DESCRIPTION: Creates a black rectangular region at (13, 101) spanning 75 by 16 pixels.
; PLAN: r0=13(x), r1=101(y), r2=75(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 101
LDI r2, 75
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
