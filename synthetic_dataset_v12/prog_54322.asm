; DESCRIPTION: Creates a white rectangular region at (261, 145) spanning 29 by 85 pixels.
; PLAN: r0=261(x), r1=145(y), r2=29(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 145
LDI r2, 29
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
