; DESCRIPTION: Draws a blue rectangle at (393, 18) with width 75 and height 108.
; PLAN: r0=393(x), r1=18(y), r2=75(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 18
LDI r2, 75
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
