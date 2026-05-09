; DESCRIPTION: Draws a magenta rectangle at (175, 143) with width 34 and height 44.
; PLAN: r0=175(x), r1=143(y), r2=34(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 143
LDI r2, 34
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
