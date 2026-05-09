; DESCRIPTION: Creates a white rectangular region at (133, 95) spanning 49 by 78 pixels.
; PLAN: r0=133(x), r1=95(y), r2=49(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 95
LDI r2, 49
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
