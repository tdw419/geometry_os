; DESCRIPTION: Renders a black box of size 78x49 starting at (276, 114).
; PLAN: r0=276(x), r1=114(y), r2=78(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 114
LDI r2, 78
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
