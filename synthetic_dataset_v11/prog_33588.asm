; DESCRIPTION: Renders a blue box of size 64x67 starting at (130, 3).
; PLAN: r0=130(x), r1=3(y), r2=64(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 3
LDI r2, 64
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
