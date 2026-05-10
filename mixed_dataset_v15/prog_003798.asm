; DESCRIPTION: Creates a white rectangular region at (352, 110) spanning 75 by 15 pixels.
; PLAN: r0=352(x), r1=110(y), r2=75(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 110
LDI r2, 75
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
