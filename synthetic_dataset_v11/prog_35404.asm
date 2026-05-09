; DESCRIPTION: Renders a purple box of size 26x67 starting at (78, 150).
; PLAN: r0=78(x), r1=150(y), r2=26(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 150
LDI r2, 26
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
