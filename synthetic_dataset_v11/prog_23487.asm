; DESCRIPTION: Creates a white rectangular region at (116, 89) spanning 20 by 33 pixels.
; PLAN: r0=116(x), r1=89(y), r2=20(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 89
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
