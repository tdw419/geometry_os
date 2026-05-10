; DESCRIPTION: Draws a magenta rectangle at (394, 144) with width 117 and height 11.
; PLAN: r0=394(x), r1=144(y), r2=117(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 144
LDI r2, 117
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
