; DESCRIPTION: Renders a blue box of size 69x61 starting at (109, 122).
; PLAN: r0=109(x), r1=122(y), r2=69(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 122
LDI r2, 69
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
