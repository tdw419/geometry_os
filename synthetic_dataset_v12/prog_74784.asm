; DESCRIPTION: Renders a white box of size 33x102 starting at (430, 88).
; PLAN: r0=430(x), r1=88(y), r2=33(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 88
LDI r2, 33
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
