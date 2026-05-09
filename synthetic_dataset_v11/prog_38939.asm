; DESCRIPTION: Creates a white rectangular region at (71, 199) spanning 56 by 52 pixels.
; PLAN: r0=71(x), r1=199(y), r2=56(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 199
LDI r2, 56
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
