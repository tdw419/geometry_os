; DESCRIPTION: Draws a green rectangle at (236, 85) with width 65 and height 82.
; PLAN: r0=236(x), r1=85(y), r2=65(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 85
LDI r2, 65
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
