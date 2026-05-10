; DESCRIPTION: Renders a magenta rectangular region spanning 73 by 97 at (350, 47).
; PLAN: r0=350(x), r1=47(y), r2=73(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 47
LDI r2, 73
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
