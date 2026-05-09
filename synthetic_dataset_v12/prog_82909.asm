; DESCRIPTION: Draws a magenta rectangle at (160, 70) with width 98 and height 30.
; PLAN: r0=160(x), r1=70(y), r2=98(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 70
LDI r2, 98
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
