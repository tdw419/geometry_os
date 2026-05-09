; DESCRIPTION: Renders a green box of size 69x89 starting at (314, 163).
; PLAN: r0=314(x), r1=163(y), r2=69(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 163
LDI r2, 69
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
