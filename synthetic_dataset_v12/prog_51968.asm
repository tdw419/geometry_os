; DESCRIPTION: Renders a black box of size 114x31 starting at (362, 100).
; PLAN: r0=362(x), r1=100(y), r2=114(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 100
LDI r2, 114
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
