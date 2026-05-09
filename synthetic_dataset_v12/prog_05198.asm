; DESCRIPTION: Draws a blue rectangle at (234, 198) with width 26 and height 50.
; PLAN: r0=234(x), r1=198(y), r2=26(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 198
LDI r2, 26
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
