; DESCRIPTION: Renders a red box of size 23x101 starting at (310, 87).
; PLAN: r0=310(x), r1=87(y), r2=23(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 87
LDI r2, 23
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
