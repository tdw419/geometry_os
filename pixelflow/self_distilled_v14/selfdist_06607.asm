; DESCRIPTION: Renders a magenta rectangular region spanning 79 by 86 at (263, 22).
; PLAN: r0=263(x), r1=22(y), r2=79(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 22
LDI r2, 79
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
