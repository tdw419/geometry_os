; DESCRIPTION: Renders a magenta rectangular region spanning 80 by 68 at (1, 37).
; PLAN: r0=1(x), r1=37(y), r2=80(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 37
LDI r2, 80
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
