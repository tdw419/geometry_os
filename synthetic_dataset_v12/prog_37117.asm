; DESCRIPTION: Draws a blue rectangle at (233, 58) with width 54 and height 97.
; PLAN: r0=233(x), r1=58(y), r2=54(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 58
LDI r2, 54
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
