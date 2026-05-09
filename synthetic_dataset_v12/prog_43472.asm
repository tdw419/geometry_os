; DESCRIPTION: Creates a white rectangular region at (52, 61) spanning 57 by 15 pixels.
; PLAN: r0=52(x), r1=61(y), r2=57(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 61
LDI r2, 57
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
