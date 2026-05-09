; DESCRIPTION: Renders a green box of size 118x66 starting at (132, 17).
; PLAN: r0=132(x), r1=17(y), r2=118(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 17
LDI r2, 118
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
