; DESCRIPTION: Draws a magenta rectangle at (77, 208) with width 102 and height 48.
; PLAN: r0=77(x), r1=208(y), r2=102(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 208
LDI r2, 102
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
