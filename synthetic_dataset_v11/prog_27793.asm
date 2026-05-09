; DESCRIPTION: Renders a purple box of size 73x51 starting at (60, 70).
; PLAN: r0=60(x), r1=70(y), r2=73(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 70
LDI r2, 73
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
