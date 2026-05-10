; DESCRIPTION: Creates a white rectangular region at (250, 54) spanning 107 by 66 pixels.
; PLAN: r0=250(x), r1=54(y), r2=107(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 54
LDI r2, 107
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
