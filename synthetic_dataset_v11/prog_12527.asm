; DESCRIPTION: Draws a blue rectangle at (4, 42) with width 96 and height 59.
; PLAN: r0=4(x), r1=42(y), r2=96(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 42
LDI r2, 96
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
