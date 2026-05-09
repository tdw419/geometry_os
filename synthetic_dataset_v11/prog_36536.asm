; DESCRIPTION: Creates a black rectangular region at (21, 3) spanning 87 by 26 pixels.
; PLAN: r0=21(x), r1=3(y), r2=87(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 3
LDI r2, 87
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
