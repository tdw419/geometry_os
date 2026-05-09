; DESCRIPTION: Renders a blue box of size 62x23 starting at (319, 6).
; PLAN: r0=319(x), r1=6(y), r2=62(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 6
LDI r2, 62
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
