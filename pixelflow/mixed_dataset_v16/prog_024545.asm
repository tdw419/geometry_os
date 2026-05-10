; DESCRIPTION: Creates a yellow rectangular region at (147, 69) spanning 116 by 85 pixels.
; PLAN: r0=147(x), r1=69(y), r2=116(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 69
LDI r2, 116
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
