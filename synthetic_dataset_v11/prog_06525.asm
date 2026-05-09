; DESCRIPTION: Draws a blue rectangle at (138, 47) with width 80 and height 43.
; PLAN: r0=138(x), r1=47(y), r2=80(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 47
LDI r2, 80
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
