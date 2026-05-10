; DESCRIPTION: Draws a magenta rectangle at (384, 160) with width 60 and height 30.
; PLAN: r0=384(x), r1=160(y), r2=60(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 160
LDI r2, 60
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
