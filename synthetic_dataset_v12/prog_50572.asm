; DESCRIPTION: Renders a white box of size 100x52 starting at (158, 108).
; PLAN: r0=158(x), r1=108(y), r2=100(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 108
LDI r2, 100
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
