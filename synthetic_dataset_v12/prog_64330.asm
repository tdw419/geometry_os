; DESCRIPTION: Renders a magenta box of size 26x37 starting at (51, 208).
; PLAN: r0=51(x), r1=208(y), r2=26(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 208
LDI r2, 26
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
