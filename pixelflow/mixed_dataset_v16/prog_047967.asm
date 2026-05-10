; DESCRIPTION: Renders a black box of size 25x67 starting at (172, 158).
; PLAN: r0=172(x), r1=158(y), r2=25(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 158
LDI r2, 25
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
