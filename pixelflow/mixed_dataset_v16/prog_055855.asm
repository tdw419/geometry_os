; DESCRIPTION: Creates a white rectangular region at (261, 105) spanning 98 by 90 pixels.
; PLAN: r0=261(x), r1=105(y), r2=98(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 105
LDI r2, 98
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
