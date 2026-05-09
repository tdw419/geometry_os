; DESCRIPTION: Creates a white rectangular region at (205, 32) spanning 21 by 89 pixels.
; PLAN: r0=205(x), r1=32(y), r2=21(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 32
LDI r2, 21
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
