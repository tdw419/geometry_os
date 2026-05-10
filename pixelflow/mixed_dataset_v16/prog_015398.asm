; DESCRIPTION: Draws a magenta rectangle at (313, 28) with width 40 and height 44.
; PLAN: r0=313(x), r1=28(y), r2=40(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 28
LDI r2, 40
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
