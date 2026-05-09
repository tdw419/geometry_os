; DESCRIPTION: Renders a magenta box of size 112x34 starting at (138, 158).
; PLAN: r0=138(x), r1=158(y), r2=112(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 158
LDI r2, 112
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
