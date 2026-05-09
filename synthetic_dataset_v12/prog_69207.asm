; DESCRIPTION: Draws a blue rectangle at (260, 50) with width 57 and height 118.
; PLAN: r0=260(x), r1=50(y), r2=57(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 50
LDI r2, 57
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
