; DESCRIPTION: Creates a white rectangular region at (278, 2) spanning 97 by 74 pixels.
; PLAN: r0=278(x), r1=2(y), r2=97(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 2
LDI r2, 97
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
