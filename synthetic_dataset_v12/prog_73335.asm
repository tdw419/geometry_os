; DESCRIPTION: Draws a blue rectangle at (60, 65) with width 44 and height 39.
; PLAN: r0=60(x), r1=65(y), r2=44(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 65
LDI r2, 44
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
