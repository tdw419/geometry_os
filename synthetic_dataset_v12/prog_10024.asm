; DESCRIPTION: Draws a red rectangle at (219, 106) with width 120 and height 79.
; PLAN: r0=219(x), r1=106(y), r2=120(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 106
LDI r2, 120
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
