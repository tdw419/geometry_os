; DESCRIPTION: Renders a black box of size 18x95 starting at (72, 101).
; PLAN: r0=72(x), r1=101(y), r2=18(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 101
LDI r2, 18
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
