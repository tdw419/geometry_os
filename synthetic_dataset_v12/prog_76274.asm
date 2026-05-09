; DESCRIPTION: Creates a white rectangular region at (159, 94) spanning 35 by 89 pixels.
; PLAN: r0=159(x), r1=94(y), r2=35(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 94
LDI r2, 35
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
