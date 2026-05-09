; DESCRIPTION: Creates a red rectangular region at (89, 94) spanning 101 by 43 pixels.
; PLAN: r0=89(x), r1=94(y), r2=101(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 94
LDI r2, 101
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
