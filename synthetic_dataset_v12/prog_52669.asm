; DESCRIPTION: Renders a black box of size 54x71 starting at (11, 77).
; PLAN: r0=11(x), r1=77(y), r2=54(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 77
LDI r2, 54
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
