; DESCRIPTION: Renders a white box of size 97x107 starting at (390, 100).
; PLAN: r0=390(x), r1=100(y), r2=97(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 100
LDI r2, 97
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
