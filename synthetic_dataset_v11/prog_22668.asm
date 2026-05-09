; DESCRIPTION: Renders a black box of size 49x14 starting at (107, 196).
; PLAN: r0=107(x), r1=196(y), r2=49(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 196
LDI r2, 49
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
