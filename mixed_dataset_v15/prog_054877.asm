; DESCRIPTION: Draws a magenta rectangle at (210, 36) with width 40 and height 46.
; PLAN: r0=210(x), r1=36(y), r2=40(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 36
LDI r2, 40
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
