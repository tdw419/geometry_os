; DESCRIPTION: Creates a white rectangular region at (310, 105) spanning 15 by 57 pixels.
; PLAN: r0=310(x), r1=105(y), r2=15(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 105
LDI r2, 15
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
