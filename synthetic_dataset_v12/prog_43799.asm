; DESCRIPTION: Draws a magenta rectangle at (286, 61) with width 59 and height 81.
; PLAN: r0=286(x), r1=61(y), r2=59(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 61
LDI r2, 59
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
