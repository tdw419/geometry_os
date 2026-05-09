; DESCRIPTION: Draws a magenta rectangle at (237, 132) with width 16 and height 103.
; PLAN: r0=237(x), r1=132(y), r2=16(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 132
LDI r2, 16
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
