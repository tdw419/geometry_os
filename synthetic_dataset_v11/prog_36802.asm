; DESCRIPTION: Renders a white box of size 101x52 starting at (78, 138).
; PLAN: r0=78(x), r1=138(y), r2=101(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 138
LDI r2, 101
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
