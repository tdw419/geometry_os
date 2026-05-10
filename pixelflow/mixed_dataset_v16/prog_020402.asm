; DESCRIPTION: Renders a blue rectangular region spanning 30 by 51 at (209, 175).
; PLAN: r0=209(x), r1=175(y), r2=30(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 175
LDI r2, 30
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
