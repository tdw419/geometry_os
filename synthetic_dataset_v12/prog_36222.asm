; DESCRIPTION: Draws a magenta rectangle at (337, 33) with width 75 and height 117.
; PLAN: r0=337(x), r1=33(y), r2=75(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 33
LDI r2, 75
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
