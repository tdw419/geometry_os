; DESCRIPTION: Draws a blue rectangle at (54, 194) with width 97 and height 27.
; PLAN: r0=54(x), r1=194(y), r2=97(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 194
LDI r2, 97
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
