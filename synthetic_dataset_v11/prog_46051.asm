; DESCRIPTION: Draws a blue rectangle at (38, 44) with width 65 and height 19.
; PLAN: r0=38(x), r1=44(y), r2=65(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 44
LDI r2, 65
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
