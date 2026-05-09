; DESCRIPTION: Draws a blue rectangle at (99, 28) with width 37 and height 111.
; PLAN: r0=99(x), r1=28(y), r2=37(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 28
LDI r2, 37
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
