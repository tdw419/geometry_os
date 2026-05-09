; DESCRIPTION: Draws a blue rectangle at (126, 157) with width 104 and height 99.
; PLAN: r0=126(x), r1=157(y), r2=104(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 157
LDI r2, 104
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
