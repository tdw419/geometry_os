; DESCRIPTION: Renders a white box of size 11x43 starting at (158, 137).
; PLAN: r0=158(x), r1=137(y), r2=11(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 137
LDI r2, 11
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
