; DESCRIPTION: Renders a black box of size 67x82 starting at (101, 140).
; PLAN: r0=101(x), r1=140(y), r2=67(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 140
LDI r2, 67
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
