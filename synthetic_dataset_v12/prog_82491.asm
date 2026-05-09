; DESCRIPTION: Renders a blue box of size 51x112 starting at (72, 24).
; PLAN: r0=72(x), r1=24(y), r2=51(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 24
LDI r2, 51
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
