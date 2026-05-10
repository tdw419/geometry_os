; DESCRIPTION: Draws a magenta rectangle at (384, 48) with width 77 and height 99.
; PLAN: r0=384(x), r1=48(y), r2=77(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 48
LDI r2, 77
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
