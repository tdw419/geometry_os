; DESCRIPTION: Draws a purple rectangle at (328, 6) with width 104 and height 103.
; PLAN: r0=328(x), r1=6(y), r2=104(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 6
LDI r2, 104
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
