; DESCRIPTION: Draws a blue rectangle at (451, 146) with width 37 and height 51.
; PLAN: r0=451(x), r1=146(y), r2=37(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 146
LDI r2, 37
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
