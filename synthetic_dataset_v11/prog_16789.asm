; DESCRIPTION: Draws a red rectangle at (20, 65) with width 92 and height 63.
; PLAN: r0=20(x), r1=65(y), r2=92(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 65
LDI r2, 92
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
