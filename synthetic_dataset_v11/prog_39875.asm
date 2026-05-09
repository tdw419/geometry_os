; DESCRIPTION: Renders a black box of size 101x67 starting at (2, 155).
; PLAN: r0=2(x), r1=155(y), r2=101(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 155
LDI r2, 101
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
