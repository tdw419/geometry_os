; DESCRIPTION: Renders a purple box of size 87x51 starting at (48, 0).
; PLAN: r0=48(x), r1=0(y), r2=87(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 0
LDI r2, 87
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
