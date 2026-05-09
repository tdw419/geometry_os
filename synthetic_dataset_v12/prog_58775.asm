; DESCRIPTION: Creates a white rectangular region at (461, 151) spanning 24 by 76 pixels.
; PLAN: r0=461(x), r1=151(y), r2=24(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 151
LDI r2, 24
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
