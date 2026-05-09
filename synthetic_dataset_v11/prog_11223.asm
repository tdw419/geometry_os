; DESCRIPTION: Renders a black box of size 69x11 starting at (89, 25).
; PLAN: r0=89(x), r1=25(y), r2=69(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 25
LDI r2, 69
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
