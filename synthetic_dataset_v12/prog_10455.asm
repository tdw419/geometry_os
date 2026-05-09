; DESCRIPTION: Creates a yellow rectangular region at (155, 133) spanning 90 by 116 pixels.
; PLAN: r0=155(x), r1=133(y), r2=90(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 133
LDI r2, 90
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
