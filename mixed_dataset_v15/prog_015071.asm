; DESCRIPTION: Draws a magenta rectangle at (272, 69) with width 91 and height 87.
; PLAN: r0=272(x), r1=69(y), r2=91(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 69
LDI r2, 91
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
