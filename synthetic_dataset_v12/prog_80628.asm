; DESCRIPTION: Renders a magenta box of size 24x112 starting at (22, 127).
; PLAN: r0=22(x), r1=127(y), r2=24(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 127
LDI r2, 24
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
