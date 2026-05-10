; DESCRIPTION: Draws a magenta rectangle at (294, 44) with width 115 and height 54.
; PLAN: r0=294(x), r1=44(y), r2=115(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 44
LDI r2, 115
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
