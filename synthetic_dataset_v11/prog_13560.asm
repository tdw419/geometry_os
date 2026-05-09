; DESCRIPTION: Creates a white rectangular region at (145, 115) spanning 57 by 12 pixels.
; PLAN: r0=145(x), r1=115(y), r2=57(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 115
LDI r2, 57
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
