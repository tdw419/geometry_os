; DESCRIPTION: Draws a blue rectangle at (42, 114) with width 18 and height 74.
; PLAN: r0=42(x), r1=114(y), r2=18(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 114
LDI r2, 18
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
