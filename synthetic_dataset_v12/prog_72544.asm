; DESCRIPTION: Renders a white box of size 118x29 starting at (132, 137).
; PLAN: r0=132(x), r1=137(y), r2=118(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 137
LDI r2, 118
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
