; DESCRIPTION: Creates a white rectangular region at (151, 175) spanning 64 by 26 pixels.
; PLAN: r0=151(x), r1=175(y), r2=64(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 175
LDI r2, 64
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
