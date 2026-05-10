; DESCRIPTION: Creates a green rectangular region at (248, 147) spanning 105 by 75 pixels.
; PLAN: r0=248(x), r1=147(y), r2=105(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 147
LDI r2, 105
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
