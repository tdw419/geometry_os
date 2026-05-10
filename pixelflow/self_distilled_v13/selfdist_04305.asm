; DESCRIPTION: Draws a purple rectangle at (30, 30) with size 90x70 then a blue line from (0, 255) to (255, 0).
; PLAN: r0=30(x1), r1=30(y1), r2=90(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 30
LDI r2, 90
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
