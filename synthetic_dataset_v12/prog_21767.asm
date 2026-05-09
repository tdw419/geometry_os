; DESCRIPTION: Creates a white rectangular region at (110, 15) spanning 29 by 14 pixels.
; PLAN: r0=110(x), r1=15(y), r2=29(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 15
LDI r2, 29
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
