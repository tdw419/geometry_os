; DESCRIPTION: Renders a yellow box of size 74x49 starting at (67, 194).
; PLAN: r0=67(x), r1=194(y), r2=74(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 194
LDI r2, 74
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
