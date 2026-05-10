; DESCRIPTION: Draws a magenta rectangle at (63, 152) with width 92 and height 85.
; PLAN: r0=63(x), r1=152(y), r2=92(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 152
LDI r2, 92
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
