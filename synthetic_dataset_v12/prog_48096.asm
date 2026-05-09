; DESCRIPTION: Renders a white box of size 88x41 starting at (250, 17).
; PLAN: r0=250(x), r1=17(y), r2=88(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 17
LDI r2, 88
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
