; DESCRIPTION: Renders a black box of size 57x114 starting at (107, 66).
; PLAN: r0=107(x), r1=66(y), r2=57(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 66
LDI r2, 57
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
