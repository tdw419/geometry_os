; DESCRIPTION: Renders a blue box of size 90x51 starting at (87, 112).
; PLAN: r0=87(x), r1=112(y), r2=90(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 112
LDI r2, 90
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
