; DESCRIPTION: Renders a purple box of size 51x61 starting at (175, 0).
; PLAN: r0=175(x), r1=0(y), r2=51(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 0
LDI r2, 51
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
