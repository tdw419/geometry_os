; DESCRIPTION: Draws a magenta rectangle at (8, 129) with width 79 and height 71.
; PLAN: r0=8(x), r1=129(y), r2=79(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 129
LDI r2, 79
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
