; DESCRIPTION: Renders a black box of size 72x97 starting at (158, 1).
; PLAN: r0=158(x), r1=1(y), r2=72(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 1
LDI r2, 72
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
