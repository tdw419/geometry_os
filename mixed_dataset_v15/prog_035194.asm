; DESCRIPTION: Draws a blue rectangle at (350, 74) with width 56 and height 109.
; PLAN: r0=350(x), r1=74(y), r2=56(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 74
LDI r2, 56
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
