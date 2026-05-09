; DESCRIPTION: Renders a magenta box of size 18x118 starting at (113, 19).
; PLAN: r0=113(x), r1=19(y), r2=18(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 19
LDI r2, 18
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
