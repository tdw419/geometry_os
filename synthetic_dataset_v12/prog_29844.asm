; DESCRIPTION: Draws a red rectangle at (63, 111) with width 81 and height 108.
; PLAN: r0=63(x), r1=111(y), r2=81(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 111
LDI r2, 81
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
