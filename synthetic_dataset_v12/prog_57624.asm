; DESCRIPTION: Draws a blue rectangle at (271, 14) with width 10 and height 104.
; PLAN: r0=271(x), r1=14(y), r2=10(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 14
LDI r2, 10
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
