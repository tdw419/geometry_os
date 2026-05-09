; DESCRIPTION: Creates a white rectangular region at (136, 103) spanning 66 by 89 pixels.
; PLAN: r0=136(x), r1=103(y), r2=66(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 103
LDI r2, 66
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
