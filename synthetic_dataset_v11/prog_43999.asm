; DESCRIPTION: Draws a blue rectangle at (21, 39) with width 79 and height 106.
; PLAN: r0=21(x), r1=39(y), r2=79(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 39
LDI r2, 79
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
