; DESCRIPTION: Draws a magenta rectangle at (64, 83) with width 103 and height 91.
; PLAN: r0=64(x), r1=83(y), r2=103(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 83
LDI r2, 103
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
