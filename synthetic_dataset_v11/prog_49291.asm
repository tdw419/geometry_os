; DESCRIPTION: Creates a black rectangular region at (162, 85) spanning 23 by 56 pixels.
; PLAN: r0=162(x), r1=85(y), r2=23(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 85
LDI r2, 23
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
