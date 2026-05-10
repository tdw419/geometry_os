; DESCRIPTION: Draws a magenta rectangle at (46, 92) with width 48 and height 72.
; PLAN: r0=46(x), r1=92(y), r2=48(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 92
LDI r2, 48
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
