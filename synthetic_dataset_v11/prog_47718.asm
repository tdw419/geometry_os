; DESCRIPTION: Creates a white rectangular region at (89, 176) spanning 98 by 71 pixels.
; PLAN: r0=89(x), r1=176(y), r2=98(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 176
LDI r2, 98
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
