; DESCRIPTION: Creates a white rectangular region at (79, 119) spanning 62 by 89 pixels.
; PLAN: r0=79(x), r1=119(y), r2=62(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 119
LDI r2, 62
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
