; DESCRIPTION: Renders a black box of size 22x119 starting at (469, 70).
; PLAN: r0=469(x), r1=70(y), r2=22(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 70
LDI r2, 22
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
