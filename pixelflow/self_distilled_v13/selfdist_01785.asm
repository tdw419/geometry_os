; DESCRIPTION: Draws a magenta rectangle at (192, 27) with width 45 and height 27.
; PLAN: r0=192(x), r1=27(y), r2=45(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 27
LDI r2, 45
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
