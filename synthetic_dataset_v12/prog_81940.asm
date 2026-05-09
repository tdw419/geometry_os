; DESCRIPTION: Creates a black rectangular region at (148, 99) spanning 52 by 106 pixels.
; PLAN: r0=148(x), r1=99(y), r2=52(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 99
LDI r2, 52
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
