; DESCRIPTION: Renders a blue box of size 105x63 starting at (59, 140).
; PLAN: r0=59(x), r1=140(y), r2=105(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 140
LDI r2, 105
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
