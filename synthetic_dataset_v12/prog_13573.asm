; DESCRIPTION: Draws a blue rectangle at (25, 151) with width 117 and height 90.
; PLAN: r0=25(x), r1=151(y), r2=117(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 151
LDI r2, 117
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
