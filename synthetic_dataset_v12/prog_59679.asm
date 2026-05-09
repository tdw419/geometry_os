; DESCRIPTION: Draws a magenta rectangle at (345, 44) with width 10 and height 34.
; PLAN: r0=345(x), r1=44(y), r2=10(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 44
LDI r2, 10
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
