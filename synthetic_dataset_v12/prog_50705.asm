; DESCRIPTION: Draws a magenta rectangle at (433, 144) with width 70 and height 86.
; PLAN: r0=433(x), r1=144(y), r2=70(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 144
LDI r2, 70
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
