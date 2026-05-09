; DESCRIPTION: Draws a magenta rectangle at (411, 40) with width 59 and height 32.
; PLAN: r0=411(x), r1=40(y), r2=59(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 40
LDI r2, 59
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
