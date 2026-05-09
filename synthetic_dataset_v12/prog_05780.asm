; DESCRIPTION: Creates a white rectangular region at (147, 122) spanning 110 by 106 pixels.
; PLAN: r0=147(x), r1=122(y), r2=110(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 122
LDI r2, 110
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
