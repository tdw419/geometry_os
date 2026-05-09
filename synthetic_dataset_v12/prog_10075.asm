; DESCRIPTION: Draws a magenta rectangle at (221, 202) with width 73 and height 20.
; PLAN: r0=221(x), r1=202(y), r2=73(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 202
LDI r2, 73
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
