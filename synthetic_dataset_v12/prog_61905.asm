; DESCRIPTION: Creates a white rectangular region at (155, 87) spanning 85 by 21 pixels.
; PLAN: r0=155(x), r1=87(y), r2=85(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 87
LDI r2, 85
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
