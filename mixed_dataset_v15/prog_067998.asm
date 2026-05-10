; DESCRIPTION: Draws a magenta rectangle at (272, 180) with width 23 and height 18.
; PLAN: r0=272(x), r1=180(y), r2=23(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 180
LDI r2, 23
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
