; DESCRIPTION: Draws a red rectangle at (92, 132) with width 63 and height 54.
; PLAN: r0=92(x), r1=132(y), r2=63(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 132
LDI r2, 63
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
