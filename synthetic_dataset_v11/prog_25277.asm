; DESCRIPTION: Renders a green box of size 100x94 starting at (90, 155).
; PLAN: r0=90(x), r1=155(y), r2=100(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 155
LDI r2, 100
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
