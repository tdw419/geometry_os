; DESCRIPTION: Renders a magenta box of size 63x22 starting at (369, 44).
; PLAN: r0=369(x), r1=44(y), r2=63(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 44
LDI r2, 63
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
