; DESCRIPTION: Renders a magenta box of size 40x57 starting at (155, 81).
; PLAN: r0=155(x), r1=81(y), r2=40(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 81
LDI r2, 40
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
