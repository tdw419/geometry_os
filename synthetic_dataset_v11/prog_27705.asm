; DESCRIPTION: Renders a magenta box of size 114x105 starting at (111, 51).
; PLAN: r0=111(x), r1=51(y), r2=114(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 51
LDI r2, 114
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
