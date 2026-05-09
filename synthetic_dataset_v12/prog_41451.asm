; DESCRIPTION: Renders a magenta box of size 35x96 starting at (369, 2).
; PLAN: r0=369(x), r1=2(y), r2=35(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 2
LDI r2, 35
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
