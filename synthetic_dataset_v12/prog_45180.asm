; DESCRIPTION: Creates a white rectangular region at (339, 25) spanning 71 by 87 pixels.
; PLAN: r0=339(x), r1=25(y), r2=71(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 25
LDI r2, 71
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
