; DESCRIPTION: Renders a black box of size 19x16 starting at (232, 15).
; PLAN: r0=232(x), r1=15(y), r2=19(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 15
LDI r2, 19
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
