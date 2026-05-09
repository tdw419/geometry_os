; DESCRIPTION: Draws a blue rectangle at (2, 11) with width 93 and height 10.
; PLAN: r0=2(x), r1=11(y), r2=93(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 11
LDI r2, 93
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
