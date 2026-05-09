; DESCRIPTION: Draws a blue rectangle at (328, 145) with width 85 and height 31.
; PLAN: r0=328(x), r1=145(y), r2=85(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 145
LDI r2, 85
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
