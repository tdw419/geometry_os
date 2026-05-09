; DESCRIPTION: Draws a magenta rectangle at (393, 161) with width 67 and height 87.
; PLAN: r0=393(x), r1=161(y), r2=67(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 161
LDI r2, 67
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
