; DESCRIPTION: Renders a purple box of size 72x101 starting at (181, 67).
; PLAN: r0=181(x), r1=67(y), r2=72(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 67
LDI r2, 72
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
