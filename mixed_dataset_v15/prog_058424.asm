; DESCRIPTION: Renders a magenta box of size 63x85 starting at (411, 136).
; PLAN: r0=411(x), r1=136(y), r2=63(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 136
LDI r2, 63
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
