; DESCRIPTION: Renders a blue box of size 97x18 starting at (329, 51).
; PLAN: r0=329(x), r1=51(y), r2=97(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 51
LDI r2, 97
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
