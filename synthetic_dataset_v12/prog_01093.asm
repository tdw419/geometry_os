; DESCRIPTION: Creates a black rectangular region at (468, 75) spanning 26 by 16 pixels.
; PLAN: r0=468(x), r1=75(y), r2=26(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 75
LDI r2, 26
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
