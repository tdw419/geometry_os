; DESCRIPTION: Draws a blue rectangle at (190, 54) with width 59 and height 31.
; PLAN: r0=190(x), r1=54(y), r2=59(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 54
LDI r2, 59
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
