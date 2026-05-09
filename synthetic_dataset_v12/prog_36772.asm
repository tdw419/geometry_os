; DESCRIPTION: Draws a blue rectangle at (42, 66) with width 81 and height 107.
; PLAN: r0=42(x), r1=66(y), r2=81(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 66
LDI r2, 81
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
