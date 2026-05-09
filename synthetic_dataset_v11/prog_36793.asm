; DESCRIPTION: Creates a white rectangular region at (147, 37) spanning 106 by 108 pixels.
; PLAN: r0=147(x), r1=37(y), r2=106(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 37
LDI r2, 106
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
