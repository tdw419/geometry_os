; DESCRIPTION: Draws a blue rectangle at (144, 59) with width 103 and height 99.
; PLAN: r0=144(x), r1=59(y), r2=103(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 59
LDI r2, 103
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
