; DESCRIPTION: Renders a magenta box of size 32x96 starting at (132, 123).
; PLAN: r0=132(x), r1=123(y), r2=32(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 123
LDI r2, 32
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
