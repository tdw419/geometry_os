; DESCRIPTION: Renders a white box of size 62x92 starting at (78, 52).
; PLAN: r0=78(x), r1=52(y), r2=62(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 52
LDI r2, 62
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
