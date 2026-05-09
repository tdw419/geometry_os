; DESCRIPTION: Draws a blue rectangle at (97, 57) with width 59 and height 34.
; PLAN: r0=97(x), r1=57(y), r2=59(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 57
LDI r2, 59
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
