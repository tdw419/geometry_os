; DESCRIPTION: Draws a magenta rectangle at (266, 50) with width 98 and height 91.
; PLAN: r0=266(x), r1=50(y), r2=98(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 50
LDI r2, 98
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
