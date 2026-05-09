; DESCRIPTION: Creates a white rectangular region at (7, 144) spanning 34 by 15 pixels.
; PLAN: r0=7(x), r1=144(y), r2=34(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 144
LDI r2, 34
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
