; DESCRIPTION: Renders a black box of size 56x22 starting at (106, 105).
; PLAN: r0=106(x), r1=105(y), r2=56(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 105
LDI r2, 56
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
