; DESCRIPTION: Draws a magenta rectangle at (166, 117) with width 77 and height 120.
; PLAN: r0=166(x), r1=117(y), r2=77(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 117
LDI r2, 77
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
