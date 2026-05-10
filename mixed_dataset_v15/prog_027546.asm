; DESCRIPTION: Draws a magenta rectangle at (368, 209) with width 99 and height 36.
; PLAN: r0=368(x), r1=209(y), r2=99(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 209
LDI r2, 99
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
