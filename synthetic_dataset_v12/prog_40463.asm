; DESCRIPTION: Draws a blue rectangle at (245, 4) with width 79 and height 74.
; PLAN: r0=245(x), r1=4(y), r2=79(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 4
LDI r2, 79
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
