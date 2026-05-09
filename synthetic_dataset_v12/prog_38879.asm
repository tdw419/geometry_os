; DESCRIPTION: Creates a white rectangular region at (155, 133) spanning 40 by 96 pixels.
; PLAN: r0=155(x), r1=133(y), r2=40(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 133
LDI r2, 40
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
