; DESCRIPTION: Creates a white rectangular region at (93, 147) spanning 41 by 57 pixels.
; PLAN: r0=93(x), r1=147(y), r2=41(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 147
LDI r2, 41
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
