; DESCRIPTION: Renders a black box of size 69x107 starting at (368, 1).
; PLAN: r0=368(x), r1=1(y), r2=69(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 1
LDI r2, 69
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
