; DESCRIPTION: Draws a magenta rectangle at (245, 109) with width 94 and height 35.
; PLAN: r0=245(x), r1=109(y), r2=94(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 109
LDI r2, 94
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
