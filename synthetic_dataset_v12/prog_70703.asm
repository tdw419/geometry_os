; DESCRIPTION: Renders a magenta box of size 63x26 starting at (109, 123).
; PLAN: r0=109(x), r1=123(y), r2=63(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 123
LDI r2, 63
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
