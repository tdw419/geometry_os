; DESCRIPTION: Creates a white rectangular region at (11, 226) spanning 57 by 20 pixels.
; PLAN: r0=11(x), r1=226(y), r2=57(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 226
LDI r2, 57
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
