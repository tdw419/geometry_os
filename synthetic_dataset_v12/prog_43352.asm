; DESCRIPTION: Renders a blue box of size 58x111 starting at (191, 84).
; PLAN: r0=191(x), r1=84(y), r2=58(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 84
LDI r2, 58
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
