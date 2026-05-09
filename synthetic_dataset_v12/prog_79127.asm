; DESCRIPTION: Renders a black box of size 25x72 starting at (138, 77).
; PLAN: r0=138(x), r1=77(y), r2=25(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 77
LDI r2, 25
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
