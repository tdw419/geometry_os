; DESCRIPTION: Renders a black box of size 15x10 starting at (307, 122).
; PLAN: r0=307(x), r1=122(y), r2=15(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 122
LDI r2, 15
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
