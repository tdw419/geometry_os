; DESCRIPTION: Renders a black box of size 24x114 starting at (488, 115).
; PLAN: r0=488(x), r1=115(y), r2=24(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 115
LDI r2, 24
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
