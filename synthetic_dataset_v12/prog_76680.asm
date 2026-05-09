; DESCRIPTION: Draws a blue rectangle at (209, 4) with width 23 and height 93.
; PLAN: r0=209(x), r1=4(y), r2=23(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 4
LDI r2, 23
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
