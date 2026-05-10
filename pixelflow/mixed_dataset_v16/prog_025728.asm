; DESCRIPTION: Renders a blue box of size 68x84 starting at (183, 44).
; PLAN: r0=183(x), r1=44(y), r2=68(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 44
LDI r2, 68
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
