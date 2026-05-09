; DESCRIPTION: Draws a purple rectangle at (342, 152) with width 23 and height 51.
; PLAN: r0=342(x), r1=152(y), r2=23(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 152
LDI r2, 23
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
