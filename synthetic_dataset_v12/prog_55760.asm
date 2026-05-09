; DESCRIPTION: Renders a blue box of size 112x37 starting at (196, 19).
; PLAN: r0=196(x), r1=19(y), r2=112(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 19
LDI r2, 112
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
