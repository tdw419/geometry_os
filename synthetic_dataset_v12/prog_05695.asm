; DESCRIPTION: Draws a magenta rectangle at (120, 44) with width 25 and height 108.
; PLAN: r0=120(x), r1=44(y), r2=25(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 44
LDI r2, 25
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
