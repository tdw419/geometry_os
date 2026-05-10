; DESCRIPTION: Creates a white rectangular region at (232, 112) spanning 95 by 70 pixels.
; PLAN: r0=232(x), r1=112(y), r2=95(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 112
LDI r2, 95
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
