; DESCRIPTION: Renders a blue box of size 85x107 starting at (312, 67).
; PLAN: r0=312(x), r1=67(y), r2=85(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 67
LDI r2, 85
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
