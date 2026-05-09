; DESCRIPTION: Draws a magenta rectangle at (9, 61) with width 27 and height 72.
; PLAN: r0=9(x), r1=61(y), r2=27(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 61
LDI r2, 27
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
