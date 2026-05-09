; DESCRIPTION: Draws a magenta rectangle at (333, 40) with width 60 and height 59.
; PLAN: r0=333(x), r1=40(y), r2=60(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 40
LDI r2, 60
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
