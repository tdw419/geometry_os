; DESCRIPTION: Renders a black box of size 40x115 starting at (101, 24).
; PLAN: r0=101(x), r1=24(y), r2=40(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 24
LDI r2, 40
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
