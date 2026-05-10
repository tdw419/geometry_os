; DESCRIPTION: Renders a white box of size 15x18 starting at (41, 20).
; PLAN: r0=41(x), r1=20(y), r2=15(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 20
LDI r2, 15
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
