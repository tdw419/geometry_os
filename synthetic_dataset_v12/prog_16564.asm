; DESCRIPTION: Draws a magenta rectangle at (353, 152) with width 40 and height 63.
; PLAN: r0=353(x), r1=152(y), r2=40(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 152
LDI r2, 40
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
