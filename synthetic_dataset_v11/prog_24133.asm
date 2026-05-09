; DESCRIPTION: Creates a black rectangular region at (147, 134) spanning 59 by 106 pixels.
; PLAN: r0=147(x), r1=134(y), r2=59(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 134
LDI r2, 59
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
