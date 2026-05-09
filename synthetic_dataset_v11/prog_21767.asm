; DESCRIPTION: Draws a magenta rectangle at (59, 196) with width 54 and height 36.
; PLAN: r0=59(x), r1=196(y), r2=54(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 196
LDI r2, 54
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
