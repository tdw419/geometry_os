; DESCRIPTION: Creates a white rectangular region at (357, 164) spanning 119 by 81 pixels.
; PLAN: r0=357(x), r1=164(y), r2=119(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 164
LDI r2, 119
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
