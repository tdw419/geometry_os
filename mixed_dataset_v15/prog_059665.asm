; DESCRIPTION: Renders a black box of size 69x89 starting at (9, 109).
; PLAN: r0=9(x), r1=109(y), r2=69(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 109
LDI r2, 69
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
