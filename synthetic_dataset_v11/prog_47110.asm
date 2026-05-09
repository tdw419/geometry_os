; DESCRIPTION: Creates a white rectangular region at (170, 26) spanning 38 by 85 pixels.
; PLAN: r0=170(x), r1=26(y), r2=38(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 26
LDI r2, 38
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
