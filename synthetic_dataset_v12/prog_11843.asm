; DESCRIPTION: Creates a white rectangular region at (1, 22) spanning 24 by 105 pixels.
; PLAN: r0=1(x), r1=22(y), r2=24(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 22
LDI r2, 24
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
