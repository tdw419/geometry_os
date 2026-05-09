; DESCRIPTION: Renders a magenta box of size 17x100 starting at (424, 138).
; PLAN: r0=424(x), r1=138(y), r2=17(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 138
LDI r2, 17
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
