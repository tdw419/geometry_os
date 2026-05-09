; DESCRIPTION: Renders a blue box of size 69x98 starting at (334, 12).
; PLAN: r0=334(x), r1=12(y), r2=69(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 12
LDI r2, 69
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
