; DESCRIPTION: Draws a blue rectangle at (162, 19) with width 93 and height 27.
; PLAN: r0=162(x), r1=19(y), r2=93(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 19
LDI r2, 93
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
