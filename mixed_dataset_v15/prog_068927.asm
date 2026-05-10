; DESCRIPTION: Renders a blue box of size 14x51 starting at (453, 21).
; PLAN: r0=453(x), r1=21(y), r2=14(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 21
LDI r2, 14
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
