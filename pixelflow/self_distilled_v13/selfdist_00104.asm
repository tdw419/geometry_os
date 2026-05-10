; DESCRIPTION: Draws a red rectangle at (396, 65) with width 90 and height 79.
; PLAN: r0=396(x), r1=65(y), r2=90(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 65
LDI r2, 90
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
