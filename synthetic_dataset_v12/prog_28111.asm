; DESCRIPTION: Draws a blue rectangle at (225, 39) with width 27 and height 54.
; PLAN: r0=225(x), r1=39(y), r2=27(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 39
LDI r2, 27
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
