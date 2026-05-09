; DESCRIPTION: Draws a purple rectangle at (277, 126) with width 30 and height 110.
; PLAN: r0=277(x), r1=126(y), r2=30(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 126
LDI r2, 30
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
