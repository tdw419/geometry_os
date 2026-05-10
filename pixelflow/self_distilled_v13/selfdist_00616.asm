; DESCRIPTION: Draws a blue rectangle at (51, 18) with width 110 and height 32.
; PLAN: r0=51(x), r1=18(y), r2=110(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 18
LDI r2, 110
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
