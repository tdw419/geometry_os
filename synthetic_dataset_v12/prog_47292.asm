; DESCRIPTION: Draws a blue rectangle at (46, 65) with width 113 and height 36.
; PLAN: r0=46(x), r1=65(y), r2=113(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 65
LDI r2, 113
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
