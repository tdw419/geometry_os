; DESCRIPTION: Draws a blue rectangle at (57, 62) with width 81 and height 93.
; PLAN: r0=57(x), r1=62(y), r2=81(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 62
LDI r2, 81
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
