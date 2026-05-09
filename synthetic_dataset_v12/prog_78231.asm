; DESCRIPTION: Draws a purple rectangle at (206, 60) with width 87 and height 70.
; PLAN: r0=206(x), r1=60(y), r2=87(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 60
LDI r2, 87
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
