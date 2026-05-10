; DESCRIPTION: Draws a blue rectangle at (58, 127) with width 74 and height 115.
; PLAN: r0=58(x), r1=127(y), r2=74(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 127
LDI r2, 74
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
