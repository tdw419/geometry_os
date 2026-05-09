; DESCRIPTION: Renders a blue box of size 24x51 starting at (127, 61).
; PLAN: r0=127(x), r1=61(y), r2=24(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 61
LDI r2, 24
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
