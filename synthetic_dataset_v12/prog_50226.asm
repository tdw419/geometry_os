; DESCRIPTION: Draws a magenta rectangle at (160, 23) with width 47 and height 90.
; PLAN: r0=160(x), r1=23(y), r2=47(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 23
LDI r2, 47
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
