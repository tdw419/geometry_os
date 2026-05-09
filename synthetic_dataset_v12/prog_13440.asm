; DESCRIPTION: Creates a white rectangular region at (167, 76) spanning 89 by 21 pixels.
; PLAN: r0=167(x), r1=76(y), r2=89(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 76
LDI r2, 89
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
