; DESCRIPTION: Renders a black box of size 84x114 starting at (118, 120).
; PLAN: r0=118(x), r1=120(y), r2=84(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 120
LDI r2, 84
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
