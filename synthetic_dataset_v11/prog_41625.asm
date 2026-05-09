; DESCRIPTION: Creates a white rectangular region at (93, 34) spanning 46 by 85 pixels.
; PLAN: r0=93(x), r1=34(y), r2=46(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 34
LDI r2, 46
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
