; DESCRIPTION: Renders a magenta box of size 114x94 starting at (279, 11).
; PLAN: r0=279(x), r1=11(y), r2=114(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 11
LDI r2, 114
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
