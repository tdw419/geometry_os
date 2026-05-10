; DESCRIPTION: Creates a yellow rectangular region at (65, 147) spanning 21 by 50 pixels.
; PLAN: r0=65(x), r1=147(y), r2=21(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 147
LDI r2, 21
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
