; DESCRIPTION: Draws a magenta rectangle at (46, 194) with width 100 and height 61.
; PLAN: r0=46(x), r1=194(y), r2=100(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 194
LDI r2, 100
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
