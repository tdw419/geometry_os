; DESCRIPTION: Renders a blue box of size 33x88 starting at (51, 37).
; PLAN: r0=51(x), r1=37(y), r2=33(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 37
LDI r2, 33
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
