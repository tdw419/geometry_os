; DESCRIPTION: Renders a blue box of size 15x94 starting at (32, 25).
; PLAN: r0=32(x), r1=25(y), r2=15(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 25
LDI r2, 15
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
