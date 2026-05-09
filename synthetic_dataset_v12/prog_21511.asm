; DESCRIPTION: Draws a magenta rectangle at (156, 146) with width 36 and height 52.
; PLAN: r0=156(x), r1=146(y), r2=36(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 146
LDI r2, 36
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
