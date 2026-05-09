; DESCRIPTION: Renders a black box of size 117x67 starting at (101, 106).
; PLAN: r0=101(x), r1=106(y), r2=117(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 106
LDI r2, 117
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
