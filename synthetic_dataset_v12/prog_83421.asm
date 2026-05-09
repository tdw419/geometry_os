; DESCRIPTION: Renders a black box of size 78x107 starting at (281, 97).
; PLAN: r0=281(x), r1=97(y), r2=78(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 97
LDI r2, 78
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
