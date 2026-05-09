; DESCRIPTION: Draws a purple rectangle at (46, 16) with width 70 and height 15.
; PLAN: r0=46(x), r1=16(y), r2=70(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 16
LDI r2, 70
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
