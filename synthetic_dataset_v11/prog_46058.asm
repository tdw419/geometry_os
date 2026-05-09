; DESCRIPTION: Creates a white rectangular region at (65, 133) spanning 88 by 88 pixels.
; PLAN: r0=65(x), r1=133(y), r2=88(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 133
LDI r2, 88
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
