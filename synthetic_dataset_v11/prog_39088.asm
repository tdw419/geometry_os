; DESCRIPTION: Draws a purple rectangle at (54, 150) with width 21 and height 54.
; PLAN: r0=54(x), r1=150(y), r2=21(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 150
LDI r2, 21
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
