; DESCRIPTION: Creates a black rectangular region at (212, 162) spanning 44 by 85 pixels.
; PLAN: r0=212(x), r1=162(y), r2=44(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 162
LDI r2, 44
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
