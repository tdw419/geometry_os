; DESCRIPTION: Draws a blue rectangle at (81, 140) with width 77 and height 42.
; PLAN: r0=81(x), r1=140(y), r2=77(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 140
LDI r2, 77
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
