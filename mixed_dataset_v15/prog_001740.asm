; DESCRIPTION: Renders a black box of size 67x93 starting at (278, 1).
; PLAN: r0=278(x), r1=1(y), r2=67(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 1
LDI r2, 67
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
