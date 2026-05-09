; DESCRIPTION: Draws a magenta rectangle at (303, 168) with width 23 and height 57.
; PLAN: r0=303(x), r1=168(y), r2=23(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 168
LDI r2, 23
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
