; DESCRIPTION: Draws a magenta rectangle at (193, 199) with width 21 and height 109.
; PLAN: r0=193(x), r1=199(y), r2=21(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 199
LDI r2, 21
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
