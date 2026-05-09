; DESCRIPTION: Renders a black box of size 33x114 starting at (353, 77).
; PLAN: r0=353(x), r1=77(y), r2=33(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 77
LDI r2, 33
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
