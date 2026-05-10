; DESCRIPTION: Renders a magenta box of size 51x78 starting at (114, 73).
; PLAN: r0=114(x), r1=73(y), r2=51(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 73
LDI r2, 51
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
