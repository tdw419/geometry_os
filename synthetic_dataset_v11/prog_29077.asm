; DESCRIPTION: Draws a blue rectangle at (102, 54) with width 59 and height 86.
; PLAN: r0=102(x), r1=54(y), r2=59(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 54
LDI r2, 59
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
