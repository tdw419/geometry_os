; DESCRIPTION: Renders a purple box of size 51x40 starting at (27, 148).
; PLAN: r0=27(x), r1=148(y), r2=51(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 148
LDI r2, 51
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
