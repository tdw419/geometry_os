; DESCRIPTION: Draws a blue rectangle at (202, 54) with width 67 and height 47.
; PLAN: r0=202(x), r1=54(y), r2=67(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 54
LDI r2, 67
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
