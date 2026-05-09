; DESCRIPTION: Draws a blue rectangle at (150, 57) with width 81 and height 111.
; PLAN: r0=150(x), r1=57(y), r2=81(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 57
LDI r2, 81
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
