; DESCRIPTION: Renders a black box of size 67x13 starting at (427, 212).
; PLAN: r0=427(x), r1=212(y), r2=67(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 212
LDI r2, 67
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
