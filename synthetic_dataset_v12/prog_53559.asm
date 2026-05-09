; DESCRIPTION: Renders a black box of size 35x94 starting at (132, 48).
; PLAN: r0=132(x), r1=48(y), r2=35(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 48
LDI r2, 35
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
