; DESCRIPTION: Draws a purple rectangle at (288, 144) with width 16 and height 75.
; PLAN: r0=288(x), r1=144(y), r2=16(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 144
LDI r2, 16
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
