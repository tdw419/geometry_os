; DESCRIPTION: Renders a black box of size 81x95 starting at (366, 142).
; PLAN: r0=366(x), r1=142(y), r2=81(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 142
LDI r2, 81
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
