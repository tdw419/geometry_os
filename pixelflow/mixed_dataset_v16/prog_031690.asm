; DESCRIPTION: Renders a white box of size 43x85 starting at (76, 77).
; PLAN: r0=76(x), r1=77(y), r2=43(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 77
LDI r2, 43
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
