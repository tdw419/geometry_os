; DESCRIPTION: Renders a blue box of size 102x40 starting at (109, 63).
; PLAN: r0=109(x), r1=63(y), r2=102(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 102
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
