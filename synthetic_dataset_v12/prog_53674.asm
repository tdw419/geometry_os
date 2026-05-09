; DESCRIPTION: Creates a white rectangular region at (367, 36) spanning 34 by 110 pixels.
; PLAN: r0=367(x), r1=36(y), r2=34(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 36
LDI r2, 34
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
