; DESCRIPTION: Creates a black rectangular region at (132, 86) spanning 106 by 10 pixels.
; PLAN: r0=132(x), r1=86(y), r2=106(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 86
LDI r2, 106
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
