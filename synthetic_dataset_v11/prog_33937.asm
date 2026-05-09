; DESCRIPTION: Draws a blue rectangle at (178, 39) with width 42 and height 81.
; PLAN: r0=178(x), r1=39(y), r2=42(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 39
LDI r2, 42
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
