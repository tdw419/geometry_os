; DESCRIPTION: Renders a blue box of size 25x51 starting at (135, 30).
; PLAN: r0=135(x), r1=30(y), r2=25(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 30
LDI r2, 25
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
