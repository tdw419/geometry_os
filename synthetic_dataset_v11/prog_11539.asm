; DESCRIPTION: Draws a blue rectangle at (98, 12) with width 50 and height 51.
; PLAN: r0=98(x), r1=12(y), r2=50(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 12
LDI r2, 50
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
