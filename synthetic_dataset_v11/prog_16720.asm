; DESCRIPTION: Draws a blue rectangle at (46, 70) with width 85 and height 79.
; PLAN: r0=46(x), r1=70(y), r2=85(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 70
LDI r2, 85
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
