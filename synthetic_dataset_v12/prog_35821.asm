; DESCRIPTION: Creates a white rectangular region at (161, 63) spanning 43 by 89 pixels.
; PLAN: r0=161(x), r1=63(y), r2=43(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 63
LDI r2, 43
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
