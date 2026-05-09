; DESCRIPTION: Renders a blue box of size 96x51 starting at (77, 197).
; PLAN: r0=77(x), r1=197(y), r2=96(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 197
LDI r2, 96
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
