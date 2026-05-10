; DESCRIPTION: Creates a black rectangular region at (89, 147) spanning 54 by 79 pixels.
; PLAN: r0=89(x), r1=147(y), r2=54(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 147
LDI r2, 54
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
