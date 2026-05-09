; DESCRIPTION: Renders a blue box of size 69x111 starting at (72, 66).
; PLAN: r0=72(x), r1=66(y), r2=69(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 66
LDI r2, 69
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
