; DESCRIPTION: Draws a magenta rectangle at (269, 21) with width 103 and height 12.
; PLAN: r0=269(x), r1=21(y), r2=103(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 21
LDI r2, 103
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
