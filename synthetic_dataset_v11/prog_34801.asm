; DESCRIPTION: Renders a black box of size 101x14 starting at (142, 38).
; PLAN: r0=142(x), r1=38(y), r2=101(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 38
LDI r2, 101
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
