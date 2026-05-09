; DESCRIPTION: Renders a blue box of size 59x67 starting at (319, 64).
; PLAN: r0=319(x), r1=64(y), r2=59(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 64
LDI r2, 59
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
