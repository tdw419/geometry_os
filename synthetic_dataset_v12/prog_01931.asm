; DESCRIPTION: Draws a magenta rectangle at (328, 154) with width 101 and height 64.
; PLAN: r0=328(x), r1=154(y), r2=101(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 154
LDI r2, 101
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
