; DESCRIPTION: Draws a red rectangle at (140, 113) with width 85 and height 79.
; PLAN: r0=140(x), r1=113(y), r2=85(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 113
LDI r2, 85
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
