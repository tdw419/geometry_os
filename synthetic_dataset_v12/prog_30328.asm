; DESCRIPTION: Draws a blue rectangle at (59, 23) with width 35 and height 103.
; PLAN: r0=59(x), r1=23(y), r2=35(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 23
LDI r2, 35
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
