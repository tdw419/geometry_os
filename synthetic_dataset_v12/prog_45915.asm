; DESCRIPTION: Renders a blue box of size 100x109 starting at (192, 67).
; PLAN: r0=192(x), r1=67(y), r2=100(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 67
LDI r2, 100
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
