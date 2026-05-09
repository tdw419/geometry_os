; DESCRIPTION: Draws a blue rectangle at (86, 15) with width 120 and height 89.
; PLAN: r0=86(x), r1=15(y), r2=120(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 15
LDI r2, 120
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
