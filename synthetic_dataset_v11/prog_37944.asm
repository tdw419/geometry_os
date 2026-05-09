; DESCRIPTION: Renders a purple box of size 51x101 starting at (120, 152).
; PLAN: r0=120(x), r1=152(y), r2=51(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 152
LDI r2, 51
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
