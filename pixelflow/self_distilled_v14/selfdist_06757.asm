; DESCRIPTION: Draws a blue rectangle at (304, 36) with width 51 and height 20.
; PLAN: r0=304(x), r1=36(y), r2=51(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 36
LDI r2, 51
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
