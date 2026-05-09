; DESCRIPTION: Creates a green rectangular region at (414, 133) spanning 17 by 43 pixels.
; PLAN: r0=414(x), r1=133(y), r2=17(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 133
LDI r2, 17
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
