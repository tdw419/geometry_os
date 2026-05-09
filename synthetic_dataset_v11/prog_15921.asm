; DESCRIPTION: Draws a blue rectangle at (125, 58) with width 23 and height 38.
; PLAN: r0=125(x), r1=58(y), r2=23(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 58
LDI r2, 23
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
