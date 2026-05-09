; DESCRIPTION: Draws a magenta rectangle at (367, 65) with width 76 and height 85.
; PLAN: r0=367(x), r1=65(y), r2=76(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 65
LDI r2, 76
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
