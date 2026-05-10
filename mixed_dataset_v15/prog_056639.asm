; DESCRIPTION: Draws a blue rectangle at (54, 4) with width 39 and height 46.
; PLAN: r0=54(x), r1=4(y), r2=39(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 4
LDI r2, 39
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
