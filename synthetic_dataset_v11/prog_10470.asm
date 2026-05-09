; DESCRIPTION: Renders a black box of size 97x107 starting at (119, 31).
; PLAN: r0=119(x), r1=31(y), r2=97(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 31
LDI r2, 97
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
