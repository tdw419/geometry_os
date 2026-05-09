; DESCRIPTION: Creates a white rectangular region at (3, 75) spanning 52 by 77 pixels.
; PLAN: r0=3(x), r1=75(y), r2=52(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 75
LDI r2, 52
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
