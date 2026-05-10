; DESCRIPTION: Creates a green rectangular region at (239, 147) spanning 13 by 95 pixels.
; PLAN: r0=239(x), r1=147(y), r2=13(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 147
LDI r2, 13
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
