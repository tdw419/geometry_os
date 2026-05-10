; DESCRIPTION: Draws a magenta rectangle at (402, 21) with width 93 and height 24.
; PLAN: r0=402(x), r1=21(y), r2=93(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 21
LDI r2, 93
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
