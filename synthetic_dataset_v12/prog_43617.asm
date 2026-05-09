; DESCRIPTION: Creates a white rectangular region at (90, 22) spanning 105 by 15 pixels.
; PLAN: r0=90(x), r1=22(y), r2=105(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 22
LDI r2, 105
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
