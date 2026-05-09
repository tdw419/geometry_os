; DESCRIPTION: Creates a white rectangular region at (70, 15) spanning 73 by 119 pixels.
; PLAN: r0=70(x), r1=15(y), r2=73(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 15
LDI r2, 73
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
