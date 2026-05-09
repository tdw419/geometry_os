; DESCRIPTION: Creates a white rectangular region at (381, 151) spanning 107 by 43 pixels.
; PLAN: r0=381(x), r1=151(y), r2=107(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 151
LDI r2, 107
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
