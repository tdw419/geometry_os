; DESCRIPTION: Draws a blue rectangle at (175, 131) with width 33 and height 37.
; PLAN: r0=175(x), r1=131(y), r2=33(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 131
LDI r2, 33
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
