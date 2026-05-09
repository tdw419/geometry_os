; DESCRIPTION: Renders a blue box of size 91x111 starting at (149, 63).
; PLAN: r0=149(x), r1=63(y), r2=91(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 63
LDI r2, 91
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
