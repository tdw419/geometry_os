; DESCRIPTION: Draws a purple rectangle at (120, 3) with width 65 and height 25.
; PLAN: r0=120(x), r1=3(y), r2=65(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 3
LDI r2, 65
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
