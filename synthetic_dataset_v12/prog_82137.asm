; DESCRIPTION: Creates a white rectangular region at (439, 147) spanning 37 by 88 pixels.
; PLAN: r0=439(x), r1=147(y), r2=37(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 147
LDI r2, 37
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
