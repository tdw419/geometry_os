; DESCRIPTION: Renders a green box of size 110x118 starting at (329, 29).
; PLAN: r0=329(x), r1=29(y), r2=110(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 29
LDI r2, 110
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
