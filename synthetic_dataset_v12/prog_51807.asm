; DESCRIPTION: Draws a magenta rectangle at (354, 128) with width 80 and height 28.
; PLAN: r0=354(x), r1=128(y), r2=80(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 128
LDI r2, 80
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
