; DESCRIPTION: Renders a white box of size 96x43 starting at (49, 52).
; PLAN: r0=49(x), r1=52(y), r2=96(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 52
LDI r2, 96
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
