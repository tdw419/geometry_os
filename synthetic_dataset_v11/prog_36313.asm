; DESCRIPTION: Draws a magenta rectangle at (164, 8) with width 86 and height 64.
; PLAN: r0=164(x), r1=8(y), r2=86(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 8
LDI r2, 86
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
