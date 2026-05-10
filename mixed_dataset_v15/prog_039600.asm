; DESCRIPTION: Draws a blue rectangle at (224, 10) with width 81 and height 51.
; PLAN: r0=224(x), r1=10(y), r2=81(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 10
LDI r2, 81
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
