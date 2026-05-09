; DESCRIPTION: Renders a black box of size 29x115 starting at (356, 26).
; PLAN: r0=356(x), r1=26(y), r2=29(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 26
LDI r2, 29
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
