; DESCRIPTION: Draws a purple rectangle at (370, 97) with width 80 and height 91.
; PLAN: r0=370(x), r1=97(y), r2=80(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 97
LDI r2, 80
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
