; DESCRIPTION: Draws a red rectangle at (37, 168) with width 63 and height 84.
; PLAN: r0=37(x), r1=168(y), r2=63(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 168
LDI r2, 63
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
