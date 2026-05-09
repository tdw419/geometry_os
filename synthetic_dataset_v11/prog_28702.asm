; DESCRIPTION: Renders a black box of size 100x56 starting at (78, 188).
; PLAN: r0=78(x), r1=188(y), r2=100(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 100
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
